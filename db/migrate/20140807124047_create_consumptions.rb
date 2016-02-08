class CreateConsumptions < ActiveRecord::Migration
  def change
    create_table :consumptions do |t|
      t.integer :resource_id
      t.integer :use_sector_id
      t.integer :customer_id
      t.string :name
      t.float :co2_factor
      t.float :amount
      t.date :effective_date

      t.timestamps
    end
  end
end
