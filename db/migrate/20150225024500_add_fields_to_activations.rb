class AddFieldsToActivations < ActiveRecord::Migration
  def change
    add_column :activations, :fair_id, :integer
    add_column :activations, :serial_number_id, :integer
  end
end
