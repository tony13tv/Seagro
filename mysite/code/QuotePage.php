<?php

class QuotePage extends Page {
	static $db = array(
		'Email' => 'Varchar'
	);

	static $has_one = array(
		'Banner' => 'Image'
	);

	public function getCMSFields(){
		$fields = parent::getCMSFields();
		$fields->addFieldToTab('Root.Main', new TextField('Email'), 'Content');
		$fields->addFieldToTab('Root.Main', new UploadField('Banner'), 'Content');
		return $fields;
	}
}

class QuotePage_Controller extends Page_Controller {
	static $allowed_actions = array(
		'QuoteForm', 'append', 'autocomplete'
	);

	public function lineItem($count, $id, $Name, $qty) {
		return new CompositeField(
			HiddenField::create("Product[$count][ID]", '', $id)->addExtraClass('identifier'),
			TextField::create("Product[$count][Name]", '', $Name)->setAttribute('placeholder', 'Producto')->addExtraClass('w-input field producto'),
			NumericField::create("Product[$count][Qty]", '', $qty)->setAttribute('placeholder', 'Cantidad')->addExtraClass('w-input field cantidad')
		);
	}

	public function autocomplete(){
		$term = $this->request->getVar('term');
		$Products = Product::get()->filter('Name:PartialMatch', $term);
		$this->response->addHeader('Content-Type', 'application/json');
		$results = array();
		foreach ($Products->map()->toArray() as $id => $value) {
			$results[] = array('id' => $id, 'value' => $value);
		}
		return $this->response->setBody(json_encode($results));

	}

	public function QuoteForm(){
		$quotation = Quotation::get()->filter('SessionID', session_id())->first();
		if (!$quotation) {
			$quotation = new Quotation();
			$quotation->SessionID = session_id();
			$quotation->write();
		}
		$fields = $quotation->scaffoldFormFields();
		Requirements::javascript(THIRDPARTY_DIR . '/jquery/jquery.js');
		Requirements::javascript(THIRDPARTY_DIR . '/jquery-ui/jquery-ui.js');
		Requirements::javascript(THEMES_DIR . '/seagro/javascript/Quotation.js');
		Requirements::css(THIRDPARTY_DIR . '/jquery-ui-themes/smoothness/jquery-ui.min.css');
		/** @var FormField $field */
		foreach ($fields as $field) {
			$field->setAttribute('placeholder', _t('QuotePage.'.$field->Title(),$field->Title()));
			$field->setTitle('');
			$field->addExtraClass('w-input');
			if( strcasecmp( $field->getName(), 'Comment' ) == 0){
				$field->setAttribute('required', false);
			}else{
				$field->setAttribute('required', true);
			}
		}
		$fields->push(new HiddenField('ID'));
		$fields->removeByName('SessionID');
		$count = 0;
		foreach ($quotation->Products() as $Product) {
			$extra_fields = $quotation->Products()->getExtraData('', $Product->ID);
			$fields->push($this->lineItem($count++, $Product->ID, $Product->Name, $extra_fields['Qty']));
		}
		$fields->push($this->lineItem($count, null, null, null));
		$actions = new FieldList(
			FormAction::create('update', '+')->addExtraClass('boton-quote w-button'),
			FormAction::create('submit', 'Enviar')->addExtraClass('boton-quote w-button')
		);
		$form = new Form($this, 'QuoteForm', $fields, $actions);
		$form->loadDataFrom($quotation);
		return $form;
	}

	public function update($data, $QuoteForm) {
		/** @var Quotation $quotation */
		$quotation = Quotation::get()->byID($data['ID']);
		$quotation->update($data);
		foreach ($data['Product'] as $line_item) {
			if ($line_item['ID'])
				$quotation->Products()->add($line_item['ID'], array('Qty' => $line_item['Qty']));
		}
		$quotation->write();
		return array();
	}

	public function append() {
		$quotation = Quotation::get()->filter('SessionID', session_id())->first();
		if (!$quotation) {
			$quotation = new Quotation();
			$quotation->SessionID = session_id();
			$quotation->write();
		}
		$quotation->Products()->add($this->request->param('ID'), array('Qty' => 1));
		return array();
	}

	public function submit($data, $Form) {
		$this->update($data, $Form);
		if (!filter_var($data['Email'], FILTER_VALIDATE_EMAIL)) {
			$Form->addErrorMessage('Email', 'No es un correo válido', 'bad');
			return $this->redirectBack();
		}

		if(Quotation::get()->byID($data['ID'])->Products()->Count() <= 0){
			$Form->sessionMessage('Debe elegir al menos un producto', 'bad');
			return $this->redirectBack();
		}
		$quotation = Quotation::get()->byID($data['ID']);
		$from = "$quotation->Name"." <".$data['Email'].">";
		$to = DataObject::get_one('QuotePage')->Email;
		$subject = 'Solicitud de cotización de Seagro';
		$email = new Email($from, $to, $subject);
		$email->setTemplate('QuoteMail');
		$email->populateTemplate($quotation);
		if($email->send()) {
			return $this->customise(array('message' => 'Su cotización fue enviada correctamente'));
		}else{
			return $this->customise(array('message' => 'Su cotización no fue enviada. Intentelo de nuevo'));
		}
	}
}
