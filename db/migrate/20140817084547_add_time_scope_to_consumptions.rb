class AddTimeScopeToConsumptions < ActiveRecord::Migration
  def change
    add_column :consumptions, :ts_begin, :datetime
    add_column :consumptions, :ts_end, :datetime
  end
end
