<?php

class Product extends DataObject{
	static $db = array(
		'Name' => 'Varchar'
	);

	static $has_one = array(
		'ProductImg' => 'Image',
		'Brand' => 'Brand',
		'Subcategory' => 'Subcategory'
	);
}
