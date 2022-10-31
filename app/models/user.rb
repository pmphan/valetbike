class User < ApplicationRecord
  validates_presence_of   :first_name,
                          :last_name,
                          :email,
                          :password
  validates_uniqueness_of :email
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_secure_password
end
