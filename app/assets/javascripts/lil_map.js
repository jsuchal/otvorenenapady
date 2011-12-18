function little_map(div_id, lat, lon) {
    var map;
    var myOptions = {
        zoom: 8,
        center: new google.maps.LatLng(lat, lon),
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    map = new google.maps.Map(document.getElementById(div_id), myOptions);
    var marker = new google.maps.Marker({
        map: map,
        position: map.getCenter()
    });
}

