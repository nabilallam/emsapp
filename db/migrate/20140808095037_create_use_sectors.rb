class CreateUseSectors < ActiveRecord::Migration
  def change
    create_table :use_sectors do |t|
      t.string :name

      t.timestamps
    end
  end
end
