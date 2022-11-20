class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  before_validation :uniquify_identifier

  validates :identifier, presence: true, uniqueness: true

  protected
    def uniquify_identifier
      if not self.identifier
        self.identifier = SecureRandom.urlsafe_base64(16)
      end
    end
end
