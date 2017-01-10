<?php

class Store extends DataObject {
	static $db = array(
		'Title' => 'Varchar',
		'Content' => 'HTMLText',
		'Latitude' => 'Decimal(12,10)',
		'Longitude' => 'Decimal(12,10)',
	);

	static $has_one = array(
		'ContactPage' => 'ContactPage'
	);
}