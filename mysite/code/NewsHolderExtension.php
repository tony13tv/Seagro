<?php

class NewsHolderExtension extends DataExtension {
	static $has_one = array(
		'BannerTop' => 'Image'
	);

	public function updateCMSFields(FieldList $fields){
		$fields->addFieldToTab('Root.Main', UploadField::create('BannerTop', _t('NewsHolder.has_one_BannerTop', 'Banner')), 'Content');
	}
}
