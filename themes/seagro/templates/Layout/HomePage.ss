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
    <div class="contenedor-quienes-somos"><img class="circle" data-ix="circle" src="images/circle.png">
        <div class="row-quienes-somos w-row">
            <div class="colum-izquierda w-col w-col-6">
                <div class="pic1-coffee" data-ix="pic-coffee"></div>
                <div>
                    <h1 class="quienes-somos tituloslide" data-ix="productos-up-2"><em>Porque ser</em> <strong><em>Agro</em></strong> <em>es</em><br><em>es sentir</em> <strong><em>orgullo por Honduras,</em></strong><br><em>es amor por nuestras tierras</em><br><em>y sus cultivos</em></h1>
                </div>
            </div>
            <div class="colum-derecha w-col w-col-6">
                <div class="pic-tractor" data-ix="pic-tractor"></div>
                <div>
                    <div class="_2 contenido w-richtext" data-ix="productos-up-2">
                        <p>h text element allows you to create and format headings, paragraphs, blockquotes, images, and video all in one place instead of having to add and format them individually. Just double-click and easily create content.
                            <br>
                        </p>
                        <p>Static and dynamic content editing</p>
                        <p>A rich text element can be used with static or dynamic content. For static content, just drop it into any page and begin editing. For dynamic content, add a rich text field to any collection and then connect a rich text element to that field in the settings panel. Voila!</p>
                        <p>‍</p>
                    </div><a class="boton-about w-button" href="quienes-somos.html">CONOCER MÁS SOBRE <strong>SEAGRO</strong></a>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="seccin-logo">
    <div class="slider-logos">
        <div class="slider-logos w-slider" data-animation="slide" data-autoplay="1" data-delay="4000" data-duration="500" data-infinite="1">
            <div class="w-slider-mask">
                <div class="slide-logo w-slide"><img src="images/seagro4_0000_jacto.png">
                </div>
                <div class="_2 slide-logo w-slide"><img src="images/seagro4_0001_coda.png">
                </div>
                <div class="_3 slide-logo w-slide"><img src="images/seagro4_0002_pindstrup.png">
                </div>
                <div class="_2 slide-logo w-slide"><img src="images/seagro4_0003_planProd.png">
                </div>
                <div class="_2 slide-logo w-slide"><img src="images/seagro4_0004_rijik-zwaan.png">
                </div>
            </div>
        </div>
    </div>
</div>
<div class="seccin-footer">
    <div class="box-footer w-row">
        <div class="w-col w-col-4"><img data-ix="new-interaction-2" src="images/logo.png" width="269">
        </div>
        <div class="w-col w-col-8">
            <div class="contenido footer w-richtext">
                <p><strong>TIENDA PRINCIPAL</strong> - 10 Ave.13 y 14 calle #120 S.O. Bo Paz Barahona.PBX: (504) 2550-2510&nbsp;
                    <br>Fax: (504) 2550-2084</p>
                <p><strong>TIENDA COMAYAGUELA</strong>
                    <br>Parque empresarial Perisur, El Aguacate – Ofibodega No. 10 Tels.: 2245-6108/09/63
                    <br>Fax: (504) 2245-6174</p>
                <p><strong>TIENDA SIGUATEPEQUE</strong>
                    <br>Carretera CA-5, Km 116.5 Tels.: 2773-1442 /1425 /1426gro.hn</p>
            </div>
        </div>
    </div>
</div>