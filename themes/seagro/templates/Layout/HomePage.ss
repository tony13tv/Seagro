<div class="header">
    <div class="slider-box w-slider" data-animation="fade" data-autoplay="1" data-delay="4000" data-duration="500" data-easing="linear" data-infinite="1" data-ix="slider-up">
        <div class="w-slider-mask">
            <% loop $Slider %>
                <div class="slider1 w-clearfix w-slide" style="background-image: url($Image.URL);">
                    <div class="textos">
                        <h1 class="tituloslide" data-ix="texto-slider">$Content</h1>
                    </div>
                    <div class="pic-slide w-hidden-tiny">
                        <% if $ProductImage %><img data-ix="product-slider" src="$ProductImage.URL" width="262"><% end_if %>
                    </div>
                </div>
            <% end_loop %>
        </div>
        <div class="leftarrow w-slider-arrow-left"><img class="flecha" src="$ThemeDir/images/flechaizquierda.png">
        </div>
        <div class="derecho leftarrow w-slider-arrow-right"><img class="flecha" src="$ThemeDir/images/flechaderecha.png">
        </div>
    </div>
    <div class="w-clearfix w-hidden-small w-hidden-tiny"><img class="downarrow" data-ix="new-interaction" src="$ThemeDir/images/arrow-Down.png">
    </div>
</div>
<div class="seccin-productos" data-ix="productos-up-2">
	<div>
		<% with $SearchForm %>
			<form $FormAttributes>
				<% loop $Fields %>
					$Field
				<% end_loop %>
				<% loop $Actions %>
					$Field
				<% end_loop %>
			</form>
		<% end_with %>

	</div>
    <h1 class="titulo-seccion">Nuestros Productos</h1>
    <div class="contendor-productos">
        <% loop $Categories %>
            <% if $MultipleOf(4, $min) %>
                <div class="w-row">
            <% end_if %>
            <style>
                .imagepic-{$ID} {
                    background-image: url($PrincipalImg.URL);
                }
                .imagepic-{$ID}:hover {
                    background-image: -webkit-linear-gradient(270deg, rgba(151, 187, 72, .4), rgba(151, 187, 72, .4)), url($PrincipalImg.URL);
                }
            </style>
            <div class="w-col w-col-3 w-col-medium-6 w-col-small-6 w-col-tiny-6">
                <a class="link w-inline-block" href="$Link">
                    <div class="picbox">
                        <div class="imagepic imagepic-{$ID}">
                            <h1 class="titulo-productos">$Title</h1>
                            <img src="$Icon.URL" width="111">
                        </div>
                    </div>
                </a>
            </div>
            <% if $MultipleOf(4) || $Last %>
                </div>
            <% end_if %>
        <% end_loop %>
    </div>
</div>
<div class="seccin-quines-somos">
    <div class="contenedor-quienes-somos"><img class="circle" data-ix="circle" src="$ThemeDir/images/circle.png">
        <div class="row-quienes-somos w-row">
            <div class="colum-izquierda w-col w-col-6">
                <div class="pic1-coffee" data-ix="pic-coffee" style="background-image: url($AboutImg1.URL)"></div>
                <div>
                    <h1 class="quienes-somos tituloslide" data-ix="productos-up-2"><em>Porque ser</em> <strong><em>Agro</em></strong> <em>es</em><br><em>es sentir</em> <strong><em>orgullo por Honduras,</em></strong><br><em>es amor por nuestras tierras</em><br><em>y sus cultivos</em></h1>
                </div>
            </div>
            <div class="colum-derecha w-col w-col-6">
                <div class="pic-tractor" data-ix="pic-tractor" style="background-image: url($AboutImg2.URL)"></div>
                <div>
                    <div class="_2 contenido w-richtext" data-ix="productos-up-2">
                        $AboutContent
                    </div><a class="boton-about w-button" href="$Page('quienes-somos').Link">CONOCER MÁS SOBRE <strong>SEAGRO</strong></a>
                </div>
            </div>
        </div>
    </div>
</div>
