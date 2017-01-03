<?php

class CategoryPage extends Page{
	static $has_one = array(
		'PrincipalImg' => 'Image',
		'Icon' => 'Image',
		'Banner' => 'Image'
	);

	static $has_many = array(
		'Subcategories' => 'Subcategory'
	);

	function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->addFieldToTab('Root.Subcategories', new GridField('Subcategories', 'Subcategories', $this->Subcategories(), new GridFieldConfig_RelationEditor()));
		$fields->addFieldToTab('Root.Main', new UploadField('Banner', _t('CategoryPage.db_Banner', 'Banner')), 'Content');
		$fields->addFieldToTab('Root.Main', new UploadField('PrincipalImg', _t('CategoryPage.db_PrincipalImg', 'Imagen principal')), 'Content');
		$fields->addFieldToTab('Root.Main', new UploadField('Icon', _t('CategoryPage.db_Icon', 'Icono')), 'Content');
		$fields->addFieldToTab('Root.Main', new DropdownField('ParentID', 'Padre', ProductHolder::get()->map()->toArray()));
		return $fields;
	}
}

class CategoryPage_Controller extends Page_Controller{
	static $allowed_actions = array(
		'SearchProductsForm'
	);

	public function AllProducts(){
		$products = Product::get()
			->innerJoin("Subcategory", "\"Product\".\"SubcategoryID\" = \"Subcategory\".\"ID\"")
			->innerJoin("CategoryPage", "\"Subcategory\".\"CategoryPageID\" = \"CategoryPage\".\"ID\"")
			->where("\"CategoryPage\".\"ID\" = " . $this->ID);
		return PaginatedList::create($products, $this->getRequest())->setPageLength(16);
	}

	public function SearchProductsForm() {
		$fields = new FieldList(
			DropdownField::create('SubcategoryID', 'Subcategory')->setSource($this->Subcategories()->map()->toArray())->addExtraClass('filtro w-select')->setTitle('Subcategory')->setEmptyString('FILTRAR POR TIPO'),
			DropdownField::create('BrandID', 'Brand')->setSource(Brand::get()->map()->toArray())->addExtraClass('filtro w-select')->setTitle('Brand')->setEmptyString('FILTRAR POR MARCA')
		);
		$actions = new FieldList(
			FormAction::create('SearchProductsSubmit', 'BUSCAR')->addExtraClass('boton-buscar w-button')
		);
		$form = new Form($this, 'SearchProductsForm', $fields, $actions);
		$form->setFormMethod('GET');
		return $form;
	}

	public function SearchProductsSubmit($data, $SearchProductsForm) {
		$filters = array();
		$Textresult = 'Search';
		if (! empty($data['SubcategoryID'])){
			$filters['SubcategoryID'] = $data['SubcategoryID'];
		}

		if (! empty($data['BrandID'])){
			$filters['BrandID'] = $data['BrandID'];
		}

		$result = $this->AllProducts()->filter($filters);
		if ($result->count() <= 0){
			$Textresult= 'No se encontraron resultados.';
		}
		$ProductList = PaginatedList::create($result, $this->getRequest())->setPageLength(16);
		$SearchProductsForm->loadDataFrom($data);
		return compact('ProductList', 'SearchProductsForm', 'Textresult');
	}
}
