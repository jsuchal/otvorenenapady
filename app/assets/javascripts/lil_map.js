$(function() {
    $('.map').click(function() {
     var map_id = $(this).data('map-id');
     var map_canvas_id = "map_canvas_" + map_id;
     var location = $(this).data("map-location");
     little_map(map_canvas_id, location);
     return false;
    });

    function little_map(div_id, location_label) {
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
          alert("Geocode was not successful for the following reason: " + status);
        }
      });
    }
});