<?php
class Subcategory extends DataObject{

	static $db = array(
		'Name' => 'Varchar'
	);

	static $has_one = array(
		'CategoryPage' => 'CategoryPage'
	);

	static $has_many = array(
		'Products' => 'Product'
	);
}
