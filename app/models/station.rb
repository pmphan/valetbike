class Station < ApplicationRecord
  validates_presence_of    :name,
                           :address,
                           :latitude,
                           :longitude,
                           :capacity
  
  has_many :docked_bikes, class_name: :Bike, foreign_key: :current_station_id, primary_key: :identifier

end
