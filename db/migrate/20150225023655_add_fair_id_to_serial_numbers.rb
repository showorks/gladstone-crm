class AddFairIdToSerialNumbers < ActiveRecord::Migration
  def change
    add_column :serial_numbers, :fair_id, :integer
  end
end
