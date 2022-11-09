// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

//initializing our map connected to div map in application and css
var map = L.map('map').setView([42.328674, 	-72.664658], 13);

L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
}).addTo(map);

<<<<<<< HEAD
=======

var hydraIcon = L.icon({
    iconUrl: '/assets/hydra.png',     
    iconSize:     [40, 40],   
    iconAnchor:   [0, 0], 
    // point of the icon which will correspond to marker's location   
    popupAnchor:  [20, 0] 
    // point from which the popup should open relative to the iconAnchor 
    });

var BikeIcon = L.icon({
    iconUrl: '/assets/bicycle.svg',     
    iconSize:     [50, 40],   
    iconAnchor:   [0, 0], 
    // point of the icon which will correspond to marker's location   
    popupAnchor:  [20, 0] 
    // point from which the popup should open relative to the iconAnchor 
    });



var hydraIcon = L.icon({
    iconUrl: '/assets/hydra.png',     
    iconSize:     [40, 40],   
    iconAnchor:   [0, 0], 
    // point of the icon which will correspond to marker's location   
    popupAnchor:  [20, 0] 
    // point from which the popup should open relative to the iconAnchor 
    });

var BikeIcon = L.icon({
    iconUrl: '/assets/bicycle.svg',     
    iconSize:     [50, 40],   
    iconAnchor:   [0, 0], 
    // point of the icon which will correspond to marker's location   
    popupAnchor:  [20, 0] 
    // point from which the popup should open relative to the iconAnchor 
    });



var hydra = L.marker([42.328674, -72.664658], {icon: BikeIcon}).addTo(map);
var BikingIcon = L.marker([42.428674, -72.664658], {icon: BikeIcon}).addTo(map);
hydra.bindPopup("<b>Station:</b><br><b>Available Bikes:</b> <br> <b>Start</b><button type=\"button\">Click Me!</button>").openPopup();
