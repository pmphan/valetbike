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
      begin
        Station.create row
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
        bike = Bike.new row
        # if this bike does not exist yet, create a new bike
        if bike.valid?
          bike.save
          Rails.logger.debug "  [o] Created id #{row['identifier']} at station #{row['current_station_identifier']}"
        else
          # if bike exists, find by its identifier and update the row with the new info
          Bike.find_by(identifier: bike[:identifier]).update(row)
          Rails.logger.debug "  [!] Updated id #{row['identifier']}"
	      end
      end
      Rails.logger.debug "[db] Done loading bike task..."
    end
    
    private :load_bikes, :load_stations

  end
end

