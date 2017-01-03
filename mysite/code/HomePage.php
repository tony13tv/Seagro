<?php

class HomePage extends Page{

	static $db = array(
		'AboutContent' => 'HTMLText'
	);

	static $has_many = array(
		'Slider' => 'Slide'
	);

	static $many_many = array(
		'Logos' => 'Image'
	);

	static $has_one = array(
		'AboutImg1' => 'Image',
		'AboutImg2' => 'Image'
	);

	public function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->addFieldToTab('Root.Slider', new GridField('Slider', 'Slider', $this->Slider(), new GridFieldConfig_RelationEditor()));
		$fields->addFieldToTab('Root.Logos', new UploadField('Logos'));
		$fields->addFieldsToTab('Root.Conocenos', new UploadField('AboutImg1' , _t('HomePage.db_AboutImg1', 'Imagen 1')));
		$fields->addFieldsToTab('Root.Conocenos', new UploadField('AboutImg2', _t('HomePage.db_AboutImg2', 'Imagen 2')));
		$fields->addFieldsToTab('Root.Conocenos', new HtmlEditorField('AboutContent', _t('HomePage.db_AboutContent', 'Contenido')));
		return $fields;
	}
}

class HomePage_Controller extends Page_Controller{

	public function Categories() {
		return CategoryPage::get();
	}
}
