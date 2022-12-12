class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Set up paying customer
  pay_customer default_payment_processor: :stripe

  has_one :profile
  accepts_nested_attributes_for :profile

  has_one :rented_bike, class_name: :Bike, foreign_key: :current_user_id, primary_key: :identifier
  has_many :all_rides, class_name: :Ride, foreign_key: :user_id, primary_key: :identifier
end
