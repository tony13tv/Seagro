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
		$fields->addFieldToTab('Root.Main',new HtmlEditorField('Content2', _t('AboutPage.db_Content2', 'Contenido inferior')));
		$fields->addFieldToTab('Root.Main', new UploadField('Banner',  _t('AboutPage.has_one_Banner', 'Banner')), 'Content');
		$fields->addFieldToTab('Root.Main', new UploadField('MiddleImg',  _t('AboutPage.has_one_MiddleImg', 'Imagen Central')), 'Content');
		return $fields;
	}
}

class AboutPage_Controller extends Page_Controller {

}
