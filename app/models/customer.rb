class Customer < ActiveRecord::Base
  has_many :customer_resources_use_sectors
  has_many :use_sectors, -> { uniq }, through: :customer_resources_use_sectors
end
