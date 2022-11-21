class HomeController < ApplicationController
  def index
    # created instance variable in order to test the database on homepage
    @stations = Station.all.order(identifier: :asc)
    #@coords = Station.coordinates("42.3259949","42.3302883","-72.6256294","-72.6535561")
  end

  # Build a geoJSON version of stations whenever the map asks us to
  def map
    @stations = Station.all
    #@s = Station.coordinates("42.3329593","42.3358668","-72.669955","-72.6838356")

    geojson = @stations.map do |station|
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
