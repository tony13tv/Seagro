<?php

class Brand extends DataObject{
	static $db = array(
		'Name' => 'Varchar'

	);

	static $has_many = array(
		'Products' => 'Product'
	);
}