<?php

class Product extends DataObject{
	static $db = array(
		'Name' => 'Varchar',
		'Code' => 'Varchar',
		'Identifier' => 'Varchar',
		'Description' => 'HTMLText'
	);

	static $has_one = array(
		'ProductImg' => 'Image',
		'Brand' => 'Brand',
		'Subcategory' => 'Subcategory'
	);
	static $many_many = array(
		'Gallery' => 'image'
	);
	public function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->addFieldToTab('Root.Gallery', new UploadField('Gallery',  _t('Product.many_many_Gallery', 'Galería')));
		return $fields;
	}
}
