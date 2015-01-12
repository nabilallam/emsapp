class Location < ActiveRecord::Base
  belongs_to :customer
  validate :customer_id, presence: true

end
