<?php
class Page extends SiteTree {

	private static $db = array(
	);

	private static $has_one = array(
	);

}
class Page_Controller extends ContentController {

	/**
	 * An array of actions that can be accessed via a request. Each array element should be an action name, and the
	 * permissions or conditions required to allow the user to access it.
	 *
	 * <code>
	 * array (
	 *     'action', // anyone can access this action
	 *     'action' => true, // same as above
	 *     'action' => 'ADMIN', // you must have ADMIN permissions to access this action
	 *     'action' => '->checkAction' // you can only access this action if $this->checkAction() returns true
	 * );
	 * </code>
	 *
	 * @var array
	 */
	private static $allowed_actions = array (
		'CategoryPage'
	);

	private static $url_handlers = array(
		'category/$ID' => 'CategoryPage'
	);

	public function init() {
		parent::init();
		// You can include any CSS or JS required by your project here.
		// See: http://doc.silverstripe.org/framework/en/reference/requirements
	}

	public function Min() {
		return $this->iteratorPos -1;
	}

	public function CategoryPage() {
		$category = Category::get()->byID($this->getRequest()->param('ID'));
		return $this->customise(compact('category'))->renderWith(array('Page_CategoryPage', 'Page'));
	}

	public function CategoryProducts(){
		$category = Category::get()->byID($this->getRequest()->param('ID'));
		$products = Product::get()
			->innerJoin("Subcategory", "\"Product\".\"SubcategoryID\" = \"Subcategory\".\"ID\"")
			->innerJoin("Category", "\"Subcategory\".\"CategoryID\" = \"Category\".\"ID\"")
			->where("\"Category\".\"ID\" = " . $this->getRequest()->param('ID'));
		return $products;
	}

}
