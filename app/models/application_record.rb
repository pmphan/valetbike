class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  uniquify :identifier
end
