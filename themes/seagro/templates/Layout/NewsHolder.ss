<div class="header interna" >
    <div class="navegacion">
		<% include BreadCrumbs %>
        <h1 class="titulo-interna">$Title</h1>
    </div>
</div>
<div class="picslider w-hidden-tiny" style="background-image: url($BannerTop.URL)"></div>
<div class="contenido-interior" style="margin-top: 18px; margin-bottom: 22px;">

	<% loop $TotalChildArticles %>
		<% if $MultipleOf(3, $min) %>
			<div class="w-row display-flex" style="margin-bottom: 15px;">
		<% end_if %>
		<div class="w-col w-col-4 display-flex">
			<div class="card-news">
				<div class="img-card">
					<img src="$Thumbnail.URL">
				</div>
				<div class="summary-card">
					<h1>$Title</h1>
					<div class="content-card">
						$Summary
						<div class="link-content">
                            <a href="$Link" class="link-news">+</a>
						</div>
					</div>

				</div>
			</div>
		</div>
		<% if $MultipleOf(3) || $Last %>
			</div>
		<% end_if %>
	<% end_loop %>
</div>

