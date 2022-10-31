class User < ApplicationRecord
  validates_presence_of   :first_name,
                          :last_name,
                          :email,
                          :password
  validates_uniqueness_of :email
  # TODO: No distinguishing lowercase email and uppercase email
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  # TODO: More secure password requirements
  has_secure_password
end
