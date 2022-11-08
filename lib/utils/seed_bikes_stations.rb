require 'csv'

class SeedBikesStations
  class << self
    def loads
  	  load_stations
      load_bikes
	end

	def load_stations
      Rails.logger.debug "[db] Start loading station task..."
	  require './app/models/station.rb'

	  CSV.foreach('./notes/station-data.csv', headers: true) do |row|
        data = {
	      'name': row['name'],
		  'address': row['address'],
          'latitude': row['latitude'],
          'longitude': row['longitude'],
          'capacity': row['capacity']
		}
		begin
		  Station.create data
          Rails.logger.debug "  [o] Created id #{row['identifier']} - #{row['name']}"
		rescue ActiveRecord::RecordInvalid => error
          Rails.logger.debug "  [!] Skipped id #{row['identifier']} #{error}"
		end
	  end
      Rails.logger.debug "[db] Done loading station task..."
    end

    def load_bikes
      Rails.logger.debug "[db] Start loading bike task..."
      require './app/models/bike.rb'

      CSV.foreach('./notes/bike-data.csv', headers: true) do |row|
        bike = Bike.new
        begin
          station = Station.find(row['station_id'])
          bike.current_station = station
        rescue ActiveRecord::RecordNotFound
          Rails.logger.debug "  [!] Couldn't find any station with ID:#{row['station_id']}"
        end

        begin
  	      bike.save
          Rails.logger.debug "  [o] Created id #{row['identifier']} at station #{row['current_station_identifier']}"
        rescue ActiveRecord::RecordInvalid => error
          Rails.logger.debug "  [!] Skipped id #{row['identifier']} #{error}"
	    end
      end
      Rails.logger.debug "[db] Done loading bike task..."
    end
    
    private :load_bikes, :load_stations

  end
end

