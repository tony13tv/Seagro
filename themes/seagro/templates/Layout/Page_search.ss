<div class="header interna" >
    <div class="navegacion">
		<% include BreadCrumbs %>
        <h1 class="titulo-interna">
			<% if $Query %>
                Resultados para {$Query}
			<% else %>
				Buscar
			<% end_if %>
		</h1>
    </div>
</div>
<div class="picslider w-hidden-tiny" style="background-image: url($ThemeDir/images/fotos-p-500x375.png)"></div>
<div class="contenido-interior">
    <div>
        <div class="w-row">
			<div class="_2 contenido quienes-somos w-richtext">
				<% if $Results %>
					<% loop $Results %>
						<div class="row">
							<% if $MenuTitle %>
								<a href="$Link" class="link-search">
                                    <h3>$MenuTitle</h3>
								</a>
							<% else %>
								<a href="$Subcategory.CategoryPage.Link" class="link-search">
                                    <h3>$Name</h3>
								</a>
							<% end_if %>
							<% if $Content %>
                                <p style="color: black; padding-left: 31px; font-size: 17px;">
									$Content.LimitWordCountXML
								</p>
							<% end_if %>
						</div>

					<% end_loop %>
				<% else %>
                    <h2> No se encontraron resultados </h2>
				<% end_if %>
			</div>

        </div>
    </div>
</div>

