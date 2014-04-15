var latitude = "18.393186";
var longitude = "-66.155249";
var details = "Beetle Inc - Bayamon, Puerto Rico";
var handler = Gmaps.build('Google');

handler.buildMap({ internal: {id: 'etm_map'}}, function(){
    var marker = handler.addMarker({
            lat: latitude,
            lng: longitude,
            infowindow: details
        });
    handler.map.centerOn(marker);
    handler.getMap().setZoom(12);
});
