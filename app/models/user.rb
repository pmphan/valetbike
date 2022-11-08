class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_presence_of   :first_name,
                          :last_name

  has_one :rented_bike, class_name: :Bike, foreign_key: :current_user_id, primary_key: :identifier
end
