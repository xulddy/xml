<%-- 
    Document   : map
    Created on : Mar 19, 2018, 11:33:42 PM
    Author     : tan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id="mapid"></div>
<script src="script.js"></script>
<script>

    var mymap = L.map('mapid').setView([21.0292095, 105.85247], 13);
    L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoiY2JyZHVuZ3BybyIsImEiOiJjamV1bzBncHcwOTBkMzNxamt0amhvOXNqIn0.pI1ApnDOApqhgm5tmlFWTA', {
        attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
        maxZoom: 18,
        id: 'mapbox.streets',
        accessToken: 'your.mapbox.access.token'
    }).addTo(mymap);


    var onPolyClick = function (event) {
        alert("Clicked on polygon with label:");
    };
    function onEachFeature(feature, layer) {
        var popupContent = "<p>Hà Nội Map</p>";

        if (feature.properties && feature.properties.popupContent) {
            popupContent += feature.properties.popupContent;
        }
        layer.on('mouseover', function (e) {
            this.openPopup();
        });
        layer.on('mouseout', function (e) {
            this.closePopup();
        });
        layer.on('click', function (e) {
           window.location.href='http://localhost:8080/IndexServlet?id='+feature.properties.popupContent;
        })
        layer.bindPopup(popupContent);
    }

    L.geoJSON([bactuliem], {
        style: function (feature) {
            return feature.properties && feature.properties.style;
        },
        onEachFeature: onEachFeature,
        pointToLayer: function (feature, latlng) {
            return L.circleMarker(latlng, {
                radius: 8,
                fillColor: "#ff7800",
                color: "#000",
                weight: 1,
                opacity: 1,
                fillOpacity: 0.8
            });
        }
    }).addTo(mymap);

    L.geoJSON(gialam, {
        style: function (feature) {
            return feature.properties && feature.properties.style;
        },
        onEachFeature: onEachFeature,
        pointToLayer: function (feature, latlng) {
            return L.circleMarker(latlng, {
                radius: 8,
                fillColor: "#ff7800",
                color: "#000",
                weight: 1,
                opacity: 1,
                fillOpacity: 0.8
            });
        }
    }).addTo(mymap);

    L.geoJSON(longbien, {
        style: function (feature) {
            return feature.properties && feature.properties.style;
        },
        onEachFeature: onEachFeature,
        pointToLayer: function (feature, latlng) {
            return L.circleMarker(latlng, {
                radius: 8,
                fillColor: "#ff7800",
                color: "#000",
                weight: 1,
                opacity: 1,
                fillOpacity: 0.8
            });
        }
    }).addTo(mymap);

    L.geoJSON(chuongmy, {
        style: function (feature) {
            return feature.properties && feature.properties.style;
        },
        onEachFeature: onEachFeature,
        pointToLayer: function (feature, latlng) {
            return L.circleMarker(latlng, {
                radius: 8,
                fillColor: "#ff7800",
                color: "#000",
                weight: 1,
                opacity: 1,
                fillOpacity: 0.8
            });
        }
    }).addTo(mymap);

//            var myLayer = L.geoJSON(bactuliem,{
//                style: function (feature) {
//			             return feature.properties && feature.properties.style;
//		                  },
//            }).addTo(mymap);
</script>