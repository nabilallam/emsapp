class AddLocationIdToConsumption < ActiveRecord::Migration
  def change
    add_column :consumptions, :location_id, :integer
  end
end
