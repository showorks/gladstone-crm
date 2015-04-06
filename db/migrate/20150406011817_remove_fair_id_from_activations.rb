class RemoveFairIdFromActivations < ActiveRecord::Migration
  def up
    remove_column :activations, :fair_id
  end
end
