class CustomerResourcesUseSector < ActiveRecord::Base
  belongs_to :customer
  belongs_to :use_sector
end
