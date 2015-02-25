class CreateSerialNumbers < ActiveRecord::Migration
  def change
    create_table :serial_numbers do |t|
      t.integer :snid
      t.integer :fid
      t.string :version
      t.string :edition
      t.string :fair_name
      t.string :serial_number
      t.date :issue_date
      t.boolean :active_serial_number
      t.integer :extras
      t.integer :service_plan_override

      t.timestamps null: false
    end
  end
end
