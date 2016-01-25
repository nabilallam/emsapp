class AddCustomerIdToUseSector < ActiveRecord::Migration
  def change
    add_column :use_sectors, :customer_id, :integer
  end
end
