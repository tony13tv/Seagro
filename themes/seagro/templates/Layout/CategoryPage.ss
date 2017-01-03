<% if $ProductList %>
	<% loop $ProductList %>
        <div class="modal fade" id="product-{$ID}" tabindex="-1" role="dialog" aria-labelledby="product-{$ID}label">
            <div class="modal-dialog" role="document" style="width: 80%;">
                <div class="modal-content">
                    <div>
                        <div class="barra-verde w-clearfix">

                            <div class="box-close">
                                <div class="cerrar">CERRAR &nbsp;&nbsp;</div>
                                <button type="button" class="close x" data-dismiss="modal" aria-label="Close">
                                    <div>X</div>
                                </button>
                            </div>
                        </div>
                        <div class="w-row">
                            <div class="colum-foto w-col w-col-5">
                                <img src="$ProductImg.URL" width="509">
                            </div>
                            <div class="contenido w-col w-col-7">
                                <div class="box-contenido-producto">
                                    <div class="texto">
                                        <h1 class="titulo-producto verde">$Name</h1>
                                        <a class="boton-about w-button" href="#">COTIZAR PRODUCTO</a>
                                        <div class="_2 marca">MARCA: <strong>$Brand.Name</strong>
                                            <br>CATEGORÍA: <strong style="text-transform: uppercase">$Subcategory.Name</strong>
                                            <br>CÓDIGO DE PRODUCTO: <strong>$Code</strong>
                                            <br>ID: <strong>$Identifier</strong>
                                        </div>
                                        <div class="descripcin w-richtext">
                                            <p><strong>DESCRIPCIÓN</strong></p>
											$Description
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	<% end_loop %>
<% else_if $AllProducts %>
	<% loop $AllProducts %>
        <div class="modal fade" id="product-{$ID}" tabindex="-1" role="dialog" aria-labelledby="product-{$ID}label">
            <div class="modal-dialog" role="document" style="width: 80%;">
                <div class="modal-content">
                    <div>
                        <div class="barra-verde w-clearfix">

                            <div class="box-close">
                                <div class="cerrar">CERRAR &nbsp;&nbsp;</div>
								<button type="button" class="close x" data-dismiss="modal" aria-label="Close">
									<div>X</div>
								</button>
                            </div>
                        </div>
                        <div class="w-row">
                            <div class="colum-foto w-col w-col-5">
								<img src="$ProductImg.URL" width="509">
                            </div>
                            <div class="contenido w-col w-col-7">
                                <div class="box-contenido-producto">
                                    <div class="texto">
                                        <h1 class="titulo-producto verde">$Name</h1>
										<a class="boton-about w-button" href="$Top.Page('cotizar').Link('append')/$ID">COTIZAR PRODUCTO</a>
                                        <div class="_2 marca">MARCA: <strong>$Brand.Name</strong>
                                            <br>CATEGORÍA: <strong style="text-transform: uppercase">$Subcategory.Name</strong>
                                            <br>CÓDIGO DE PRODUCTO: <strong>$Code</strong>
                                            <br>ID: <strong>$Identifier</strong>
                                        </div>
                                        <div class="descripcin w-richtext">
                                            <p><strong>DESCRIPCIÓN</strong></p>
                                            $Description
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	<% end_loop %>
<% end_if %>


<% include Navbar %>
<div class="header interna">
    <div class="navegacion">
        <% include BreadCrumbs %>
        <h1 class="titulo-interna">$Title</h1>
    </div>
    <div class="icono_producto">
        <img src="$Icon.URL">
    </div>
</div>
<div class="picslider producto w-hidden-tiny" style="background-image: url($Banner.URL);"></div>
<div class="contenido-interior">
    <div>
        <div class="barra-content">
            <div class="filtros">
                <div class="w-form">
					<% with $SearchProductsForm %>
                        <form $FormAttributes>
                            <div class="w-row">
								<% loop $Fields %>
                                    <div class="w-col w-col-4">
										$Field
                                    </div>
								<% end_loop %>
								<% loop $Actions %>
                                    <div class="w-col w-col-4">
										$Field
                                    </div>
								<% end_loop %>
                            </div>
                        </form>
					<% end_with %>
                </div>
            </div>
            <div class="contendor-productos">

				<% if $Textresult %>
					<% if $ProductList %>
						<% loop $ProductList %>
							<% if $MultipleOf(4, $min) %>
                            <div class="row-productos w-row">
							<% end_if %>
                            <style>
                                .foto-product-{$ID} {
                                    background-image: url($ProductImg.URL) !important;
                                }
                                .foto-product-{$ID}:hover {
                                    background-image: linear-gradient(180deg, rgba(34, 126, 86, .73), rgba(34, 126, 86, .73)), url($ProductImg.URL) !important;
                                }
                            </style>
                            <div class="w-col w-col-3 w-col-medium-6 w-col-small-6">
                                <div>
                                    <a class="box-producto w-inline-block" data-toggle="modal" data-target="#product-{$ID}" href="#">
                                        <div class="_1 foto foto-product-{$ID}"></div>
                                        <div class="texto">
                                            <h1 class="titulo-producto">$Name</h1>
                                            <div class="marca">$Brand.Name</div>
                                        </div>
                                    </a>
                                </div>
                            </div>
							<% if $MultipleOf(4) || $Last %>
                            </div>
							<% end_if %>
						<% end_loop %>
					<% else %>
						<h3>$Textresult</h3>
					<% end_if %>
				<% else %>
					<% loop $AllProducts %>
						<% if $MultipleOf(4, $min) %>
                        <div class="row-productos w-row">
						<% end_if %>
                        <style>
                            .foto-product-{$ID} {
                                background-image: url($ProductImg.URL) !important;
                            }
                            .foto-product-{$ID}:hover {
                                background-image: linear-gradient(180deg, rgba(34, 126, 86, .73), rgba(34, 126, 86, .73)), url($ProductImg.URL) !important;
                            }
                        </style>
                        <div class="w-col w-col-3 w-col-medium-6 w-col-small-6">
                            <div>
                                <a class="box-producto w-inline-block" data-toggle="modal" data-target="#product-{$ID}" href="#">
                                    <div class="_1 foto foto-product-{$ID}"></div>
                                    <div class="texto">
                                        <h1 class="titulo-producto">$Name</h1>
                                        <div class="marca">$Brand.Name</div>
                                    </div>
                                </a>
                            </div>
                        </div>
						<% if $MultipleOf(4) || $Last %>
                        </div>
						<% end_if %>
					<% end_loop %>
				<% end_if %>
				<% if $Textresult %>
					<% if $ProductList %>
                        <div class="Pagination">
							<% if $ProductList.MoreThanOnePage %>
                                <ul>
									<% if $ProductList.NotFirstPage %>
                                        <li>
                                            <a class="prev" href="$ProductList.PrevLink"><</a>
                                        </li>
									<% end_if %>
									<% loop $ProductList.Pages %>
										<% if $CurrentBool %>
                                            <li class="current-pagination">$PageNum</li>
										<% else %>
											<% if $Link %>
                                                <li>
                                                    <a href="$Link">$PageNum</a>
                                                </li>
											<% else %>
                                                ...
											<% end_if %>
										<% end_if %>
									<% end_loop %>
									<% if $ProductList.NotLastPage %>
                                        <li>
                                            <a class="next" href="$ProductList.NextLink">></a>
                                        </li>
									<% end_if %>
                                </ul>
							<% end_if %>
                        </div>
					<% end_if %>
				<% else %>
                    <div class="Pagination">
						<% if $AllProducts.MoreThanOnePage %>
                            <ul>
								<% if $AllProducts.NotFirstPage %>
                                    <li>
                                        <a class="prev" href="$AllProducts.PrevLink"><</a>
                                    </li>
								<% end_if %>
								<% loop $AllProducts.Pages %>
									<% if $CurrentBool %>
                                        <li class="current-pagination">$PageNum</li>
									<% else %>
										<% if $Link %>
                                            <li>
                                                <a href="$Link">$PageNum</a>
                                            </li>
										<% else %>
                                            ...
										<% end_if %>
									<% end_if %>
								<% end_loop %>
								<% if $AllProducts.NotLastPage %>
                                    <li>
                                        <a class="next" href="$AllProducts.NextLink">></a>
                                    </li>
								<% end_if %>
                            </ul>
						<% end_if %>
                    </div>
				<% end_if %>
            </div>
        </div>
    </div>
</div>
