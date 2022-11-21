// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "stripe"
import "jquery"

//initializing our map connected to div map in application and css
var map = L.map('map').setView([42.328674, 	-72.664658], 13);

//creating the "map" visual layer using openstreetmap
L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'}).addTo(map);


// gets data from the JSON on the station controller through the URL (a route in config) and then loads the markers
$.ajax({
    type: 'GET',
    url: 'home/map',
    dataType: 'json',
    success: LoadMarkers
});

// this will dymanically create the pop up and markers for the features(stations) gotten from ajaz
function createCustomIconandPopup (feature, latlng) {
    let BikeIcon = L.icon({
        iconUrl: '/assets/bicycle.svg',     
        iconSize:     [50, 40],   
        iconAnchor:   [0, 0], 
        // point of the icon which will correspond to marker's location   
        popupAnchor:  [20, 0] 
        // point from which the popup should open relative to the iconAnchor 
        });
        // Div that will be given to the marker
        let PopupDiv = document.createElement('div');
        // PopupDiv.style.width = 200;
        // Station line appended to popup Div
        let StationName = feature.properties.name;
        let stationID = feature.properties.identifier;
        let NameP = document.createElement("p");
        NameP.setAttribute("class", "pop-up");
        NameP.innerHTML = "<b> Station: </b>"+ StationName;
        PopupDiv.append(NameP);
        // Address line appended to popup Div
        let StationAddress = feature.properties.address;
        let AddressP = document.createElement("p");
        AddressP.setAttribute("class", "pop-up");
        AddressP.innerHTML = "<b>Address: </b> "+ StationAddress;
        //unsure why this is not workingß
        AddressP.style.fontsize = "15px";
        PopupDiv.append(AddressP);
        //Link to Rent a bike Appended to Popup Div (linkDiv is so I can style a div to look more button like)
        let linkDiv = document.createElement('div');
        linkDiv.setAttribute("id", "rentDiv"); 
        let linkRent = document.createElement('a');
        // set this attribute so maybe we can pass on the info of what popup they clicked to fill it in in the rent a bike form
        linkRent.setAttribute("StationCalled", feature.properties.name);
        linkRent.href = "http://localhost:3000/stations/"+stationID;
        linkRent.innerHTML = "<b>Rent Here</b>";
        linkDiv.append(linkRent);
        // Instead of trying to align here ask Team how to add a css stylesheet and try to add attributes and do it there
        linkRent.style.alignContent = "center";
        linkRent.style.color = "#000066";
        linkRent.style.fontSize = "28px";
        linkDiv.style.alignContent = "center";
        linkDiv.style.borderBottomLeftRadius = "5px";
        linkDiv.style.borderBottomRightRadius = "5px";
        linkDiv.style.borderTopLeftRadius = "5px";
        linkDiv.style.borderTopRightRadius = "5px";
        linkDiv.style.width = "160px";
        linkDiv.style.alignContent = "center";
        linkDiv.style.backgroundColor = "#99CCFF";
        PopupDiv.append(linkDiv);
    return L.marker(latlng, { icon: BikeIcon }).bindPopup(PopupDiv)
  }

// middle function to make loading markers look cleaner. Not extremely needed but have to type like the comment below for it to work without it
  let myLayerOptions = {
    pointToLayer: createCustomIconandPopup
  }


 //L.geoJSON(data , {pointToLayer: createCustomIcon}).addTo(map);
 // Will load Markers using the Ajaz data and do the customizations from myLayerOptionsthe 
function LoadMarkers(data){
   L.geoJSON(data , myLayerOptions).addTo(map);
   console.log(data);
}

//This is the action example on the starting guide to test out actions
var popup = L.popup();
function onMapClick(e) {
    popup
        .setLatLng(e.latlng)
        .setContent("You clicked the map at " + e.latlng.toString())
        .openOn(map);
}
map.on('click', onMapClick);
// probably want to use moveend to do the longlat detection of zoom??
map.on("moveend", onMapClick);

