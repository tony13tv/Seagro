<?php

class ProductsAdmin extends ModelAdmin {

	private static $managed_models = array(
		'Category',
		'Brand',
		'Type',
		'Product'
	);

	private static $url_segment = 'products';

	private static $menu_title = 'Productos';
}