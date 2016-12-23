<?php
class Category extends DataObject {
	static $db = array(
		'Name' => 'Varchar'
	);

	static $has_one = array(
		'PrincipalImg' => 'Image',
		'Icon' => 'Image'
	);

	static $has_many = array(
		'Subcategories' => 'Subcategory'
	);
}