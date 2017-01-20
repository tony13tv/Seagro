<?php

class ProductHolder extends Page{
	static $has_one = array(
		'Banner' => 'Image'
	);

}

class ProductHolder_Controller extends Page_Controller{

}