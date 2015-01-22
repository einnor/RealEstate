class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :location
      t.integer :numberOfBedRooms
      t.integer :numberOfBathRooms
      t.integer :numberOfReceptionRooms
      t.integer :size
      t.string :security
      t.decimal :price, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
