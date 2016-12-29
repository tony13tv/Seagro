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
		$fields->addFieldsToTab('Root.Conocenos', new UploadField('AboutImg1'));
		$fields->addFieldsToTab('Root.Conocenos', new UploadField('AboutImg2'));
		$fields->addFieldsToTab('Root.Conocenos', new HtmlEditorField('AboutContent'));
		return $fields;
	}
}

class HomePage_Controller extends Page_Controller{

	public function Categories() {
		return CategoryPage::get();
	}
}
