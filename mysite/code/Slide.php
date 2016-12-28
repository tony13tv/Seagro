<?php
class Slide extends DataObject{
	static $db = array(
		'Content' => 'HTMLText',
	);

	static $has_one = array(
		'Image' => 'Image',
		'ProductImage' => 'Image',
		'HomePage' => 'HomePage'
	);
}