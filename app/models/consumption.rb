class Consumption < ActiveRecord::Base
  belongs_to :customer
  belongs_to :resource
  belongs_to :use_sector
  belongs_to :location

  validates :customer_id, presence: true
  validates :resource_id, presence: true
  validates :use_sector_id, presence: true
  validates :effective_date, presence: true

  def self.prepare_short_report(customer_id)
    includes(:resource).
      where(customer_id: customer_id).group(:use_sector_id).sum(:amount)
  end
end
