class AddSyncToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :sync, :boolean
  end
end
