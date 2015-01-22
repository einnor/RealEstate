class ChangeDefaultForHousePrice < ActiveRecord::Migration
  def change
    change_column :houses, :price, :decimal, :default => 0.0
  end
end
