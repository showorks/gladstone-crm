class CreateActivations < ActiveRecord::Migration
  def change
    create_table :activations do |t|
      t.integer :aid
      t.integer :snid
      t.string :system_code
      t.string :activation_id
      t.string :computer_description
      t.date :activation_date
      t.boolean :active_activation
      t.date :deactivation_date
      t.string :deactivation_by

      t.timestamps null: false
    end
  end
end
