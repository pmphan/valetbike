class Station < ApplicationRecord
  validates_presence_of    :name,
                           :address,
                           :latitude,
                           :longitude,
                           :capacity
  
  has_many :docked_bikes, class_name: :Bike, foreign_key: :current_station_id, primary_key: :identifier

# "latitude, longitude"
# "find."
# where(latitude: lat1...lat2, longitude: long1...long2)
  scope :coordinates, -> (lat1, lat2, long1, long2) {Station.where('latitude >=? AND latitude <=? AND longitude >=? AND longitude <=?', lat1, lat2, long1, long2)}
  #scope :coordinates, -> (lat1, lat2,long1, long2) {Station.where(latitude: 1).and(Post.where(longitude: 2))}
end
