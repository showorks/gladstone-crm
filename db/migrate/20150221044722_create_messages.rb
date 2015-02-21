class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :iid
      t.integer :cid
      t.date :incident_date
      t.integer :incident_type
      t.text :incident_memo
      t.date :incident_follow_up_date
      t.boolean :incident_closed
      t.boolean :incident_charge

      t.timestamps null: false
    end
  end
end
