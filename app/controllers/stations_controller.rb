class StationsController < ApplicationController
  
  def index
    @stations = Station.all.order(identifier: :asc)
  end
  
  #build a geoJSON version of stations whenever the map asks us to
  def mapJSON
    @s = Station.all
    #@s = Station.coordinates("42.3329593","42.3358668","-72.669955","-72.6838356")

    geojson = @s.map do |station|
      {
        "type": "Feature",
        "properties": {
            "name": station.name ,
            "address": station.address,
            "popupContent": "Change This Later"
        },
        "geometry": {
            "type": "Point",
            "coordinates": [station.longitude,station.latitude] 
        }
      }
    end
    render(json: geojson)
    return geojson
  end
end
