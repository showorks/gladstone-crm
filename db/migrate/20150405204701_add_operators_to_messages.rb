class AddOperatorsToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :created_by, :integer
    add_column :messages, :updated_by, :integer
  end
end
