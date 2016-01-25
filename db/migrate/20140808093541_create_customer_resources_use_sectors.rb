class CreateCustomerResourcesUseSectors < ActiveRecord::Migration
  def change
    create_table :customer_resources_use_sectors do |t|
      t.integer :customer_id
      t.integer :resource_id
      t.integer :use_sector_id

      t.timestamps
    end
  end
end
