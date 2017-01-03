<?php

class Quotation extends DataObject {

	static $db = array(
		'Name' => 'Varchar',
		'Email' => 'Varchar',
		'Comment' => 'Text',
		'SessionID' => 'Varchar'
	);

	static $many_many = array(
		'Products' => 'pRODUCT'
	);

	static $many_many_extraFields = array(
		'Products' => array(
			'Qty' => 'Int'
		)
	);
}
