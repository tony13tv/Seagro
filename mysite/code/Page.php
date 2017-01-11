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
		'SearchForm'
	);

	private static $url_handlers = array(
	);

	public function init() {
		parent::init();
		// You can include any CSS or JS required by your project here.
		// See: http://doc.silverstripe.org/framework/en/reference/requirements
	}

	public function Min() {
		return $this->iteratorPos -1;
	}

	public function AllLogos(){
		return HomePage::get()->first()->Logos();
	}

	function SearchForm() {
		$searchText = isset($this->Query) ? $this->Query : '';
		$fields = new FieldList(
			TextField::create("Search", "", $searchText)->setAttribute('placeholder','Buscar')->addExtraClass('w-input')
		);
		$actions = new FieldList(
			FormAction::create('results', 'Buscar')->addExtraClass('boton_contactenos w-button')
		);
		return new SearchForm($this, "SearchForm", $fields, $actions);
	}

	function results($data, SearchForm $form){
		$results =	$form->getResults();
		$results->merge(Product::get()->filter('Name:PartialMatch', $form->getSearchQuery()));
		$data = array(
			'Results' => $results,
			'Query' => $form->getSearchQuery(),
			'Title' => 'Search Results'
		);
		$this->Query = $form->getSearchQuery();
		return $this->customise($data)->renderWith(array('Page_search', 'Page'));
	}
}
