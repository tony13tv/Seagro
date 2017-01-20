<div class="header interna" >
    <div class="navegacion">
        <% include BreadCrumbs %>
        <h1 class="titulo-interna">$Title</h1>
    </div>
</div>
<div class="picslider w-hidden-tiny" style="background-image: url($Banner.URL)"></div>
<div class="contenido-interior" style="margin-top: 20px; margin-bottom: 50px;">
    <div class="contendor-productos">
        <% loop $Children %>
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
                            <h1 class="titulo-productos" style="text-align: center;">$Title</h1>
                            <img src="$Icon.URL" width="111" class="center-img">
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