class Bike < ApplicationRecord
  enum :status, [:free, :reserved, :taken], prefix: true, scopes: true

  belongs_to :current_station, class_name: :Station, foreign_key: :current_station_id, primary_key: :identifier, optional: true

  #TODO: Add further relationship between user - status
  belongs_to :current_user, class_name: :User, foreign_key: :current_user_id, primary_key: :identifier, optional: true
end
