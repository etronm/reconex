var latitude = "18.393186";
var longitude = "-66.155249";
var details = "Beetle Inc - Bayamon, Puerto Rico";

function LoadGmaps() {
    var myLatlng = new google.maps.LatLng(latitude, longitude);
    var myOptions = {
        zoom: 12,
        scrollwheel: true,
        center: myLatlng,
        navigationControl: true,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }

    var map = new google.maps.Map(document.getElementById("googlemaps"), myOptions);
    var marker = new google.maps.Marker({
        position: myLatlng,
        map: map,
        icon: 'map_icon.png'});

    var infowindow = new google.maps.InfoWindow({content: details});

google.maps.event.addListener(marker, "click", function () {
    infowindow.open(map, marker);

});

}

$(window).load(function () {
LoadGmaps();
});

