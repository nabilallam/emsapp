class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.text :preferences
      t.string :unit
      t.text :description

      t.timestamps
    end
  end
end
