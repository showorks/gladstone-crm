class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :cid
      t.integer :fid
      t.string :contact_name
      t.string :contact_address
      t.string :contact_city
      t.string :contact_state
      t.string :contact_zip_code
      t.string :contact_country
      t.boolean :fair_address
      t.string :contact_phone_1
      t.string :contact_phone_2
      t.string :contact_phone_cell
      t.string :contact_email
      t.date :contact_date_registered
      t.date :contact_last_edited
      t.date :contact_date_address_last_active
      t.date :contact_last_mailed
      t.boolean :contact_active
      t.integer :contact_reputation
      t.text :contact_notes
      t.boolean :do_not_mail
      t.boolean :showorks_web_contact
      t.string :source
      t.boolean :to_print
      t.integer :valid_address
      t.boolean :bad_address
      t.boolean :bulk_mail_2000_cd
      t.boolean :to_terrell
      t.boolean :bulk_mail_2003_cd
      t.boolean :international
      t.boolean :gift_basket
      t.boolean :brochure_2004_fall
      t.boolean :christmas_card_2004
      t.boolean :temp_flag
      t.boolean :sweb_mailout
      t.boolean :nalsrma
      t.boolean :filled_out_form_at_2005_rmfa
      t.boolean :christmas_card_2005
      t.boolean :filled_out_form_at_2005_iafe
      t.boolean :followup
      t.boolean :flag
      t.boolean :excel_workshop_06
      t.boolean :eclassroom_06
      t.boolean :iafe_06
      t.boolean :competitor_booth_06
      t.date :date_last_emailed_for_service_reminder
      t.boolean :do_not_remind_for_service
      t.boolean :state_convention_07
      t.boolean :workshop_07
      t.boolean :christmas_card_07
      t.boolean :christmas_box_07
      t.boolean :beta_tester
      t.boolean :wyoming_training
      t.boolean :recieved_thank_you_from_christmas_box
      t.boolean :eblast_2012_announce
      t.boolean :christmas_2011
      t.boolean :bulk_ne

      t.timestamps null: false
    end
  end
end
