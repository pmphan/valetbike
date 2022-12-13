class HomeController < ApplicationController
  def index
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
            "identifier": station.identifier,
            "availability": station.docked_bikes.where(status: :free).count,
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
