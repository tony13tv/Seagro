<?php

class ProductHolder extends Page{
	static $has_one = array(
		'Banner' => 'Image'
	);
	function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->addFieldToTab('Root.Main', new UploadField('Banner', _t('CategoryPage.db_Banner', 'Banner')), 'Content');
		return $fields;
	}
}

class ProductHolder_Controller extends Page_Controller{

}