class AddSyncToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :sync, :boolean
  end
end
