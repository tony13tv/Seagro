<div class="header interna" >
    <div class="navegacion">
        <% include BreadCrumbs %>
        <h1 class="titulo-interna">$Title</h1>
    </div>
</div>
<div class="picslider w-hidden-tiny" style="background-image: url($Banner.URL)"></div>
<div class="contenido-interior" style="margin-top: 20px; margin-bottom: 50px;">
    <div>
        <div class="w-row">
            <div class="w-col w-col-4">
                <% if $message %>
                    $message
                <% else %>
                    <div class="card-news contactenos">
                        <% with $ContactForm %>
                            <form $FormAttributes>
                                <% loop $Fields %>
                                    <% if not $Last %>
                                        <label>$Title:</label>
                                    <% end_if %>
                                    $Field
                                <% end_loop %>
                                <% loop $Actions %>
                                    $Field
                                <% end_loop %>
                            </form>
                        <% end_with %>
                    </div>
                <% end_if %>
            </div>
            <div class="w-col w-col-8">
                <div class="w-row">
                    <div class="w-col w-col-8">
                        <div id="map"></div>
                    </div>
                    <div class="w-col w-col-4">
                        <% loop $Stores %>
                            <div class="w-row store" data-latitude="$Latitude" data-longitude="$Longitude">
                                <div class="w-col w-col-1">
                                    <div class="green-arrow" style="display: none;">&#9664</div>
                                </div>
                                <div class="w-col w-col-11">
                                    <h5 style="text-transform: uppercase;">$Title</h5>
                                    <div class="store-content">$Content</div>
                                </div>

                            </div>



                        <% end_loop %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    function initMap() {
        var myLatLng = {lat: -25.363, lng: 131.044};

        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 18,
            center: myLatLng,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
        });

        var marker = new google.maps.Marker({
            position: myLatLng,
            map: map
        });

        jQuery(function() {
            var changeMap = function() {
                var lat = $(this).data('latitude');
                var lng = $(this).data('longitude');
                var newRegion = new google.maps.LatLng(lat, lng);

                marker.setMap();

                map.panTo(newRegion);

                marker = new google.maps.Marker({
                    position: newRegion,
                    map: map,
                    //icon: '/path/to/icon.png'
                });

                if( ! $(this).hasClass("store_hover")){
                    $('.store').removeClass("store_hover");
                    $(this).addClass("store_hover");
                }
            };

            $('.store').on('mouseenter', changeMap);
            $('.store').on('click', changeMap);
        });
    }

</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD-eP4lQwkcRAwcwrOHpJbkFSnvAvopyvw&callback=initMap"></script>