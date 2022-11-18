// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "jquery"

//initializing our map connected to div map in application and css
var map = L.map('map').setView([42.328674, 	-72.664658], 13);

//creating the "map" visual layer using openstreetmap
L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'}).addTo(map);


// What I want to do 
// 1. I want to have a LayerGroup of all the markers created by the data brought 
// I want to have an event listener for the move of the map to be able to capture which 




// creating specialized Icon
var BikeIcon = L.icon({
    iconUrl: '/assets/bicycle.svg',     
    iconSize:     [50, 40],   
    iconAnchor:   [0, 0], 
    // point of the icon which will correspond to marker's location   
    popupAnchor:  [20, 0] 
    // point from which the popup should open relative to the iconAnchor 
    });


//function to put all markers on the map. Trying to pass it to the view so we can put them on
function addStationMarkers(locations) {
    for(let i = 0 ; i < locations.length; i++) {
        marker = new L.marker([locations[i][1], locations[i][2]], {icon: BikeIcon})
        .bindPopup("<b>Station:</b><br><b>Available Bikes:</b> <br> <b>Start</b>")
        .addTo(map);
    }
}

//This is the action example on the starting guide
var popup = L.popup();
function onMapClick(e) {
    popup
        .setLatLng(e.latlng)
        .setContent("You clicked the map at " + e.latlng.toString())
        .openOn(map);
}
map.on('click', onMapClick);

map.on("moveend", onMapClick);

// //Current testing markers; hardcoded 
// var hydra = L.marker([42.328674, -72.664658], {icon: BikeIcon}).addTo(map);
// var BikingIcon = L.marker([42.428674, -72.664658], {icon: BikeIcon}).addTo(map);
//hydra.bindPopup("<b>Station:</b><br><b>Available Bikes:</b> <br> <b>Start</b><button type=\"button\">Click Me!</button>").openPopup();

// gets data from the JSON on the station controller through the URL (a route in config) and then loads the markers
$.ajax({
    type: 'GET',
    url: 'stations/mapJSON',
    dataType: 'json',
    success: LoadMarkers
});

function createCustomIcon (feature, latlng) {
    let BikeIcon = L.icon({
        iconUrl: '/assets/bicycle.svg',     
        iconSize:     [50, 40],   
        iconAnchor:   [0, 0], 
        // point of the icon which will correspond to marker's location   
        popupAnchor:  [20, 0] 
        // point from which the popup should open relative to the iconAnchor 
        });
    return L.marker(latlng, { icon: BikeIcon })
  }


  let myLayerOptions = {
    pointToLayer: createCustomIcon
  }

 // myLayerOptions

function LoadMarkers(data){
   L.geoJSON(data , {pointToLayer: createCustomIcon}).bindPopup("<b>Station:</b><br><b>Available Bikes:</b> <br> <b>Start</b>").addTo(map);
   console.log(data);
}

