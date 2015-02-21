class ImportContactsJob < GladstoneJob
  require 'csv'
  queue_as :default

  def perform(*args)
    @filename_with_path = "#{Rails.root}/tmp/uploads/Contacts.csv"
    CSV.foreach(@filename_with_path, :headers => true, :header_converters => :symbol) do |row|
      contact = Contact.find_by_cid( row[:cid])
      unless contact
        contact = Contact.new
        contact.cid = row[:cid]
      end
      contact.fid = row[:fid]
      contact.contact_name = row[:contact_name]
      contact.contact_address = row[:contact_address]
      contact.contact_city = row[:contact_city]
      contact.contact_state = row[:contact_state]
      contact.contact_zip_code = row[:contact_zip_code]
      contact.contact_country = row[:contact_country]
      contact.fair_address = gs_convert_boolean( row[:fair_address])
      contact.contact_phone_1 = row[:contact_phone_1]
      contact.contact_phone_2 = row[:contact_phone_2]
      contact.contact_phone_cell = row[:contact_phone_cell]
      contact.contact_email = row[:contact_email]
      contact.contact_date_registered = gs_convert_date( row[:contact_date_registered])
      contact.contact_last_edited = gs_convert_date( row[:contact_last_edited])
      contact.contact_date_address_last_active = gs_convert_date( row[:contact_date_address_last_active])
      contact.contact_last_mailed = gs_convert_date( row[:contact_last_mailed])
      contact.contact_active = gs_convert_boolean( row[:contact_active])
      contact.contact_reputation = row[:contact_reputation]
      contact.contact_notes = row[:contact_notes]
      contact.do_not_mail = gs_convert_boolean( row[:do_not_mail])
      contact.showorks_web_contact = gs_convert_boolean( row[:showorks_web_contact])
      contact.source = row[:source]
      contact.to_print = gs_convert_boolean( row[:to_print])
      contact.valid_address = row[:valid_address]
      contact.bad_address = gs_convert_boolean( row[:bad_address])
      contact.bulk_mail_2000_cd = gs_convert_boolean( row[:bulk_mail_2000_cd])
      contact.to_terrell = gs_convert_boolean( row[:to_terrell])
      contact.bulk_mail_2003_cd = gs_convert_boolean( row[:bulk_mail_2003_cd])
      contact.international = gs_convert_boolean( row[:international])
      contact.gift_basket = gs_convert_boolean( row[:gift_basket])
      contact.brochure_2004_fall = gs_convert_boolean( row[:brochure_2004_fall])
      contact.christmas_card_2004 = gs_convert_boolean( row[:christmas_card_2004])
      contact.temp_flag = gs_convert_boolean( row[:temp_flag])
      contact.sweb_mailout = gs_convert_boolean( row[:sweb_mailout])
      contact.nalsrma = gs_convert_boolean( row[:nalsrma])
      contact.filled_out_form_at_2005_rmfa = gs_convert_boolean( row[:filled_out_form_at_2005_rmfa])
      contact.christmas_card_2005 = gs_convert_boolean( row[:christmas_card_2005])
      contact.filled_out_form_at_2005_iafe = gs_convert_boolean( row[:filled_out_form_at_2005_iafe])
      contact.followup = gs_convert_boolean( row[:followup])
      contact.flag = gs_convert_boolean( row[:flag])
      contact.excel_workshop_06 = gs_convert_boolean( row[:excel_workshop_06])
      contact.eclassroom_06 = gs_convert_boolean( row[:eclassroom_06])
      contact.iafe_06 = gs_convert_boolean( row[:iafe_06])
      contact.competitor_booth_06 = gs_convert_boolean( row[:competitor_booth_06])
      contact.date_last_emailed_for_service_reminder = gs_convert_date( row[:date_last_emailed_for_service_reminder])
      contact.do_not_remind_for_service = gs_convert_boolean( row[:do_not_remind_for_service])
      contact.state_convention_07 = gs_convert_boolean( row[:state_convention_07])
      contact.workshop_07 = gs_convert_boolean( row[:workshop_07])
      contact.christmas_card_07 = gs_convert_boolean( row[:christmas_card_07])
      contact.christmas_box_07 = gs_convert_boolean( row[:christmas_box_07])
      contact.beta_tester = gs_convert_boolean( row[:beta_tester])
      contact.wyoming_training = gs_convert_boolean( row[:wyoming_training])
      contact.recieved_thank_you_from_christmas_box = gs_convert_boolean( row[:recieved_thank_you_from_christmas_box])
      contact.eblast_2012_announce = gs_convert_boolean( row[:eblast_2012_announce])
      contact.christmas_2011 = gs_convert_boolean( row[:christmas_2011])
      contact.bulk_ne = gs_convert_boolean( row[:bulk_ne])

      # Link up to Fairs
      contact.fair = Fair.find_by_fid(row[:fid])

      contact.save
    end
  end
end
