class Ride < ApplicationRecord
  enum :status, [:active, :finished], prefix: true, scopes: true

  belongs_to :bike, class_name: :Bike, foreign_key: :bike_id, primary_key: :identifier
  belongs_to :user, class_name: :User, foreign_key: :user_id, primary_key: :identifier
  validates_presence_of :from_station
                        :start_time
                        :bike_id
                        :user_id
end
