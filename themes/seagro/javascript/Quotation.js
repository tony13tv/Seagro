/**
 * Created by efgm1024 on 1/2/17.
 */

(function ($) {
	$(".producto")
	// don't navigate away from the field on tab when selecting an item
		.on("keydown", function (event) {
			if (event.keyCode === $.ui.keyCode.TAB &&
				$(this).autocomplete("instance").menu.active) {
				event.preventDefault();
			}
		})
		.autocomplete({
			source: function (request, response) {
				$.getJSON("cotizar/autocomplete", {
					term: request.term
				}, response);
			},
			search: function () {
				// custom minLength
				var term = this.value;
				if (term.length < 2) {
					return false;
				}
			},
			focus: function () {
				// prevent value inserted on focus
				return false;
			},
			select: function (event, ui) {
				$(this).prev('.identifier').val(ui.item.id);
				this.value = ui.item.value;
				return false;
			}
		});

})(jQuery);
