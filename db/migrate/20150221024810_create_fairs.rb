class CreateFairs < ActiveRecord::Migration
  def change
    create_table :fairs do |t|
      t.integer :fid
      t.boolean :is_fair
      t.string :fair_name
      t.string :fair_state
      t.text :fair_notes
      t.string :video_key
      t.string :video_key_2009
      t.string :video_key_2006
      t.boolean :purchased
      t.boolean :returned_product
      t.boolean :converted_from_competition
      t.boolean :feather_in_hat
      t.integer :fair_time
      t.integer :incidents_remaining
      t.string :service_plan_number
      t.date :old_service_plan_ended
      t.string :old_service_plan_number
      t.boolean :international
      t.boolean :showorks_web_user
      t.boolean :temp_flag
      t.boolean :free_upgrade
      t.boolean :poor_payment
      t.boolean :christmas_2010
      t.boolean :christmas_2011
      t.boolean :processed_2012
      t.boolean :mailed_2012_invoice
      t.boolean :courtesy_late_pmt
      t.boolean :bulk_ne
      t.boolean :judas

      t.timestamps null: false
    end
  end
end
