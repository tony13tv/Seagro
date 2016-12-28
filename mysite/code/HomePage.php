<?php

class HomePage extends Page{
	static $has_many = array(
		'Slider' => 'Slide'
	);

	public function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->addFieldToTab('Root.Slider', new GridField('Slider', 'Slider', $this->Slider(), new GridFieldConfig_RelationEditor()));
		return $fields;
	}
}

class HomePage_Controller extends Page_Controller{

	public function Categories() {
		return Category::get();
	}
}