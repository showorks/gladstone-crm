class AddFairIdToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :fair_id, :integer
  end
end
