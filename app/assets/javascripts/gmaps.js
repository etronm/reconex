/**
 * Created by etronm on 4/14/14.
 */
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script>
    window.jQuery || document.write('<script src="vendor/jquery.js"><\/script>')
    </script>
<script src="http://maps.google.com/maps/api/js?sensor=true"></script>
<%= javascript_include_tag "vendor/jquery.gmap.min" %>
<script type="text/javascript">
/* for Google map */

$(window).load(function() {
    LoadGmaps();
    });

/* Add Your Company Name latitude and  longitude here.
* for latitude and longitude please check http://itouchmap.com/latlong.html
*  */
var latitude = "18.393186";
var longitude = "-66.155249";
var details = "Beetle Inc - Bayamon, Puerto Rico";

function LoadGmaps() {
    var myLatlng = new google.maps.LatLng(latitude, longitude);
    var myOptions = {
    zoom : 12,
    scrollwheel : true,
    center : myLatlng,
    navigationControl : true,
    mapTypeId : google.maps.MapTypeId.ROADMAP
    }

    var map = new google.maps.Map(document.getElementById("googlemaps"), myOptions);
    var marker = new google.maps.Marker({
    position : myLatlng,
    map : map,
    icon : '<%= image_path('map_icon.png') %>'
    });
    var infowindow = new google.maps.InfoWindow({
    content : details
    });
    google.maps.event.addListener(marker, "click", function() {
    infowindow.open(map, marker);

    });

    }

</script>