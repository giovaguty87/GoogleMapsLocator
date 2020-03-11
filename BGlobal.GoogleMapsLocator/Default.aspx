<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <h1>Google maps locator</h1>             
    </div>

    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false" type="text/javascript"></script>  
    <script>  
        var mapcode;  
        var diag; 

        function initialize() {            

            var lntP1 = new google.maps.LatLng(5.067, -75.517);
            var lntP2 = new google.maps.LatLng(4.4, -70.500);

            var start = { lat: 5.067, lng: -75.517 };
            var stop = { lat: 4.4, lng: -70.500 };

            var calc2 = getDistance(start, stop) / 1000;            

            var image = 'images/markerLocation.png';

            var contentString = '<div id="content" style="margin-left:15px;margin-top:3px;overflow:hidden;"><div id="bodyContent">'+
                 	    	'<img src="images/logo.jpg" style="width:172px;height:45px;"alt="WebStreet.in"/>'+'<br><font style="color:darkblue;font:11px tahoma;margin-left:5px;">Gio Gutiérrez Developer</font>'+
		      	'<br><br><div style="font:13px verdana;color:darkgreen;margin-left:5px;">Street 32 N° 20-10<br>Downtown' +
			'<br>Manizales Caldas - 170001<br>Colombia<br>+57 3128349299<br>gio.gutierrez@bglobalsolutions.com<br><br>'+
     		      	'<a href="/KB/aspnet/ContactForm.aspx" style="color:#00303f;font:bold 12px verdana;" title="click to contact">Contact Form</a></div>' +
                           '</div>'+
                '</div>';

            var contentString2 = '<div id="content" style="margin-left:15px;margin-top:3px;overflow:hidden;"><div id="bodyContent">' +
                '<img src="images/logo.jpg" style="width:172px;height:45px;"alt="WebStreet.in"/>' + '<br><font style="color:darkblue;font:11px tahoma;margin-left:5px;">Gio Gutiérrez Developer</font>' +
                '<br><div style="font:13px verdana;color:darkgreen;margin-left:5px;">Distance between points : ' + calc2 + ' mts.<br>' +
                '</div>' +
                '</div>';

            var infowindow = new google.maps.InfoWindow({
                content: contentString,
                width: 192,
                height: 100
            });

            var infowindow2 = new google.maps.InfoWindow({
                content: contentString2,
                width: 192,
                height: 100
            });

            mapcode = new google.maps.Geocoder();
            //var lntP1 = new google.maps.LatLng(26.45, 82.85);
            //var lntP2 = new google.maps.LatLng(20.45, 70.85);            
            
            var diagChoice = {
                zoom: 9,
                center: lntP1,
                diagId: google.maps.MapTypeId.ROADMAP
            }            

            diag = new google.maps.Map(document.getElementById('map_populate'), diagChoice);            
            
            var marker1 = new google.maps.Marker({
                position: lntP1,
                map: diag,
                title: 'Hello Gio - Point One!',
                icon: image
            });

            var marker2 = new google.maps.Marker({
                position: lntP2,
                map: diag,
                title: 'Hello Gio - Point Two!',
                icon: image
            });            

            google.maps.event.addListener(marker1, 'click', function () {
                infowindow.open(diag, marker1);
            });

            google.maps.event.addListener(marker2, 'click', function () {
                infowindow2.open(diag, marker2);
            });            
        }

        function getmap() {
            
            var completeaddress = document.getElementById('txt_location').value;
            mapcode.geocode({ 'address': completeaddress }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    diag.setCenter(results[0].geometry.location);
                    var hint = new google.maps.Marker({
                        diag: diag,
                        position: results[0].geometry.location
                    });
                } else {
                    alert('Location Not Tracked. ' + status);
                }
            });
        }

        var rad = function (x) {
            return x * Math.PI / 180;
        };

        var getDistance = function (p1, p2) {
            var R = 6378137; // Earth’s mean radius in meter
            var dLat = rad(p2.lat - p1.lat);
            var dLong = rad(p2.lng - p1.lng);
            var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
                Math.cos(rad(p1.lat)) * Math.cos(rad(p2.lat)) *
                Math.sin(dLong / 2) * Math.sin(dLong / 2);
            var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
            var d = R * c;
            return d; // returns the distance in meter
        };       

        google.maps.event.addDomListener(window, 'load', initialize);         
                       
    </script>
    <div id="map_populate" style="width:100%; height:500px; border: 5px solid #5E5454;"></div>       
    <%--<div>  
        <input type="button" value="Search" onclick="getmap()">  
    </div> --%>
</asp:Content>
