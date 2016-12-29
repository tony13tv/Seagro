<?php

class AboutPage extends Page{
	static $db = array(
		'Content2' => 'HTMLText'
	);

	static $has_one = array(
		'Banner' => 'Image',
		'MiddleImg' => 'Image'
	);

	public function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->addFieldToTab('Root.Main',new HtmlEditorField('Content2'));
		$fields->addFieldToTab('Root.Main', new UploadField('Banner'), 'Content');
		$fields->addFieldToTab('Root.Main', new UploadField('MiddleImg'), 'Content');
		return $fields;
	}
}

class AboutPage_Controller extends Page_Controller {

}
