<?php

class CategoryPage extends Page{
	static $has_one = array(
		'PrincipalImg' => 'Image',
		'Icon' => 'Image'
	);

	static $has_many = array(
		'Subcategories' => 'Subcategory'
	);

	function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->addFieldToTab('Root.Subcategories', new GridField('Subcategories', 'Subcategories', $this->Subcategories(), new GridFieldConfig_RelationEditor()));
		$fields->addFieldToTab('Root.Main', new UploadField('PrincipalImg'), 'Content');
		$fields->addFieldToTab('Root.Main', new UploadField('Icon'), 'Content');
		$fields->addFieldToTab('Root.Main', new DropdownField('ParentID', 'Parent', ProductHolder::get()->map()->toArray()));
		return $fields;
	}
}

class CategoryPage_Controller extends Page_Controller{

}