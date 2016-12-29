<div class="producto-resultado">
    <div class="contendor">
        <div class="barra-verde w-clearfix">
            <div class="box-close">
                <div class="cerrar">CERRAR &nbsp;&nbsp;</div>
                <div class="x" data-ix="close-ventana">
                    <div>X</div>
                </div>
            </div>
        </div>
        <div class="w-row">
            <div class="colum-foto w-col w-col-5">
				<img src="images/Captura-de-pantalla-2016-12-15-a-las-10.04.22-a.m..png" width="509">
            </div>
            <div class="contenido w-col w-col-7">
                <div class="box-contenido-producto">
                    <div class="texto">
                        <h1 class="titulo-producto verde">AST – ARADO SUBSOLADOR TATU</h1><a class="boton-about w-button" href="#">COTIZAR PRODUCTO</a>
                        <div class="_2 marca">MARCA: <strong>AF</strong>
                            <br>CATEGORÍA: <strong>PREPARACIÓN DE SUELOS</strong>
                            <br>CÓDIGO DE PRODUCTO: <strong>AF-AD33J1U</strong>
                            <br>ID: <strong>3977130</strong>
                        </div>
                        <div class="descripcin w-richtext">
                            <p><strong>DESCRIPCIÓN</strong>
                            </p>
                            <p>El Arado Fijo proporciona calidad y mayor rendimiento en los servicios de laboreo primario en general y en la construcción de curvas a nivel.</p>
                            <p>Estructura tubular de mayor resistencia. Regulaciones simplificadas garantizan el mejor ajuste para el trabajo en cualquier tipo de suelo.</p>
                            <p>Los cubos de los discos y rueda guía son montados con rodamientos cónicos. Los discos producidos con padrones rigorosos poseen alta resistencia al desgaste y a los impactos.</p>
                            <p>Opcional: Rueda de Profundidad, para auxiliar en el control de penetración de los discos. Peso de la rueda completa: 50 kg.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="header interna">
    <div class="navegacion">
        <div class="breadcrum"><a class="breadcrumb" href="index.html">INICIO &nbsp;·</a><a class="breadcrumb" href="index.html">PRODUCTOS</a>
        </div>
        <h1 class="titulo-interna">$category.Name</h1>
    </div>
    <div class="icono_producto"><img src="$category.Icon.URL">
    </div>
</div>
<div class="picslider producto w-hidden-tiny" style="background-image: url($category.PrincipalImg.URL)"></div>
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
                <% loop $CategoryProducts %>
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
                            <a class="box-producto w-inline-block" data-ix="abrir-producto" href="#">
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
            </div>
        </div>
    </div>
</div>
