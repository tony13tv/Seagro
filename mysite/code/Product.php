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
}
