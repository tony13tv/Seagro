<?php

class HomePage extends Page{


	static $has_many = array(
		'Slider' => 'Slide'
	);

	static $many_many = array(
		'Logos' => 'Image'
	);
	public function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->addFieldToTab('Root.Slider', new GridField('Slider', 'Slider', $this->Slider(), new GridFieldConfig_RelationEditor()));
		$fields->addFieldToTab('Root.Logos', new UploadField('Logos'));
		return $fields;
	}
}

class HomePage_Controller extends Page_Controller{

	public function Categories() {
		return CategoryPage::get();
	}
}
