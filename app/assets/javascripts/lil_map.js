$(function() {

    $('.map').click(function() {
        var map_id = $(this).data('map-id');
        var map_canvas_id = "map_canvas_" + map_id;
        var location = $(this).data("map-location");
        var location_lat = $(this).data("map-location-lat");
        var location_lon = $(this).data("map-location-lon");
        //little_map_label(map_canvas_id, location);
        little_map_gps(map_canvas_id, location_lat, location_lon);
        return false;
    });

    function little_map_gps(div_id, lat, lon){
        var map;
        var pos = new google.maps.LatLng(lat, lon);
        var myOptions = {
            zoom: 15,
            center: pos,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        map = new google.maps.Map(document.getElementById(div_id), myOptions);
        var marker = new google.maps.Marker({
            map: map,
            position: pos
        });
    }

    function little_map_label(div_id, location_label) {
        var geocoder;
        var map;
        geocoder = new google.maps.Geocoder();
        var myOptions = {
            zoom: 15,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        map = new google.maps.Map(document.getElementById(div_id), myOptions);

        geocoder.geocode( { 'address': location_label}, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);
                var marker = new google.maps.Marker({
                    map: map,
                    position: results[0].geometry.location
                });
            } else {
                //alert("Geocode was not successful for the following reason: " + status);
            }
        });
    }
    $('a[data-toggle-id="map-143"]').click();
    $('a[data-toggle-id="map-144"]').click();
    $('a[data-toggle-id="map-145"]').click();
    $('a[data-toggle-id="map-111"]').click();
    $('a[data-toggle-id="map-112"]').click();
    $('a[data-toggle-id="map-114"]').click();
    $('a[data-toggle-id="map-115"]').click();
    $('a[data-toggle-id="map-116"]').click();

});
