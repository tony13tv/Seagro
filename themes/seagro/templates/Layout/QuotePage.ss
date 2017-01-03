<div class="header interna" >
    <div class="navegacion">
		<% include BreadCrumbs %>
        <h1 class="titulo-interna">$Title</h1>
    </div>
</div>
<div class="picslider w-hidden-tiny" style="background-image: url($Banner.URL)"></div>
<div class="contenido-interior">
	<div>
        <div class="w-row">
            <div class="w-col w-col-8 form-quote">
				<% if $message %>
					<h1 class="_2 contenido quienes-somos w-richtext" style="font-size: 24px;">$message</h1>
				<% else %>
					<% with $QuoteForm %>
                        <form $FormAttributes >
							<% loop $Fields %>
								$Field
							<% end_loop %>

							<% loop $Actions %>
								$Field
							<% end_loop %>
                        </form>
					<% end_with %>
				<% end_if %>
            </div>
        </div>
	</div>



</div>
