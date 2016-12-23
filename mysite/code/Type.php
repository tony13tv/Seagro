<?php

class Type extends DataObject{
	static $db = array(
		'Name' => 'Varchar'
	);

	static $has_many = array(
		'Products' => 'Product'
	);
}