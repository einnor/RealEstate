class AddPhotoToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :photo, :string
  end
end
