<?php

class ContactPage extends Page {

	static $has_one = array(
		'Banner' => 'Image'
	);

	static $db = array(
		'Email' => 'Varchar'
	);

	static $has_many = array(
		'Stores' => 'Store'
	);

	function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->addFieldToTab('Root.Main', new UploadField('Banner'), 'Content');
		$fields->addFieldToTab('Root.Main', new EmailField('Email'), 'Content');
		$fields->addFieldToTab('Root.Tiendas', new GridField('Stores', _t('ContactPage.Stores', 'Tiendas'), $this->Stores(), new GridFieldConfig_RelationEditor()));
		return $fields;
	}


}

class ContactPage_Controller extends Page_Controller {

	static $allowed_actions = array(
		'ContactForm'
	);

	public function ContactForm() {
		$fields = FieldList::create(
			TextField::create('Name','Nombre')->addExtraClass('w-input'),
			EmailField::create('Email', 'Correo Electrónico')->addExtraClass('w-input'),
			TextareaField::create('Content', 'Contenido')->addExtraClass('w-input')->setRows(6)
		);
		$actions = FieldList::create(
			FormAction::create('ContactSubmit', 'Enviar >')->addExtraClass('boton_contactenos w-button')
		);
		$form = new Form($this, 'ContactForm', $fields, $actions);
		return $form;
	}

	public function ContactSubmit($data, $ContactForm) {
		$allData = array(
			'Name' => $data['Name'],
			'Email' => $data['Email'],
			'Content' => $data['Content']
		);
		$from = $data['Name']."<".$data['Email']." >";
		$to = $this->Email;
		$subject = 'Contáctenos';
		$email = new Email($from, $to, $subject);
		$email->setTemplate('ContactMail');
		$email->populateTemplate($allData);
		if ($email->send()){
			return $this->customise(array('message' => 'Su solicitud se ha enviado exitosamente'));
		}else{
			return $this->customise(array('message' => 'Su solicitud no ha sido enviada. Intentelo mas tarde'));
		}
	}
}