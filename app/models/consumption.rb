class Consumption < ActiveRecord::Base
  belongs_to :customer
  belongs_to :resource
  belongs_to :use_sector
  belongs_to :location

  validates :customer_id, presence: true
  validates :resource_id, presence: true
  validates :use_sector_id, presence: true
  validate :begin_bigger_end

  def self.prepare_short_report(customer_id)
    includes(:resource).
      where(customer_id: customer_id).group(:use_sector_id).sum(:amount)
  end


  def begin_bigger_end
    if ts_begin.present? && ts_end.present?
      unless ts_begin <= ts_end
        errors.add(:ts_begin, 'End-Datum ist kleiner als Begin-Datum.')
      end
    end
  end
end
