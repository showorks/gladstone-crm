class ImportContactsJob < GladstoneJob
  require 'csv'

  def perform(*args)
    filename_with_path = "#{Rails.root}/tmp/uploads/Contacts.csv"
    contacts = []
    fairs = Fair.where("fid > 0").pluck(:fid, :id) # Load fairs into fairs array so we don't hit the DB each time

    # Import data from CSV
    CSV.foreach(filename_with_path, :headers => true, :header_converters => :symbol, :encoding => 'ISO-8859-1:utf-8') do |row|

      # Look in fairs array for fid and get id
      if row[:fid].present? && fairs.select{ |fid, id| fid == row[:fid].to_i }.size > 0
        fair_id = fairs.select{ |fid, id| fid == row[:fid].to_i }[0][1].to_i
      else
        fair_id = 0
      end

      # Import CSV into contacts array
      contacts << Contact.new(
        cid:                                    row[:cid],
        fid:                                    row[:fid],
        contact_name:                           row[:contact_name],
        contact_address:                        row[:contact_address],
        contact_city:                           row[:contact_city],
        contact_state:                          row[:contact_state],
        contact_zip_code:                       row[:contact_zip_code],
        contact_country:                        row[:contact_country],
        fair_address:                           gs_convert_boolean( row[:fair_address]),
        contact_phone_1:                        row[:contact_phone_1],
        contact_phone_2:                        row[:contact_phone_2],
        contact_phone_cell:                     row[:contact_phone_cell],
        contact_email:                          row[:contact_email],
        contact_date_registered:                gs_convert_date( row[:contact_date_registered]),
        contact_last_edited:                    gs_convert_date( row[:contact_last_edited]),
        contact_date_address_last_active:       gs_convert_date( row[:contact_date_address_last_active]),
        contact_last_mailed:                    gs_convert_date( row[:contact_last_mailed]),
        contact_active:                         gs_convert_boolean( row[:contact_active]),
        contact_reputation:                     row[:contact_reputation],
        contact_notes:                          row[:contact_notes],
        do_not_mail:                            gs_convert_boolean( row[:do_not_mail]),
        showorks_web_contact:                   gs_convert_boolean( row[:showorks_web_contact]),
        source:                                 row[:source],
        to_print:                               gs_convert_boolean( row[:to_print]),
        valid_address:                          row[:valid_address],
        bad_address:                            gs_convert_boolean( row[:bad_address]),
        bulk_mail_2000_cd:                      gs_convert_boolean( row[:bulk_mail_2000_cd]),
        to_terrell:                             gs_convert_boolean( row[:to_terrell]),
        bulk_mail_2003_cd:                      gs_convert_boolean( row[:bulk_mail_2003_cd]),
        international:                          gs_convert_boolean( row[:international]),
        gift_basket:                            gs_convert_boolean( row[:gift_basket]),
        brochure_2004_fall:                     gs_convert_boolean( row[:brochure_2004_fall]),
        christmas_card_2004:                    gs_convert_boolean( row[:christmas_card_2004]),
        temp_flag:                              gs_convert_boolean( row[:temp_flag]),
        sweb_mailout:                           gs_convert_boolean( row[:sweb_mailout]),
        nalsrma:                                gs_convert_boolean( row[:nalsrma]),
        filled_out_form_at_2005_rmfa:           gs_convert_boolean( row[:filled_out_form_at_2005_rmfa]),
        christmas_card_2005:                    gs_convert_boolean( row[:christmas_card_2005]),
        filled_out_form_at_2005_iafe:           gs_convert_boolean( row[:filled_out_form_at_2005_iafe]),
        followup:                               gs_convert_boolean( row[:followup]),
        flag:                                   gs_convert_boolean( row[:flag]),
        excel_workshop_06:                      gs_convert_boolean( row[:excel_workshop_06]),
        eclassroom_06:                          gs_convert_boolean( row[:eclassroom_06]),
        iafe_06:                                gs_convert_boolean( row[:iafe_06]),
        competitor_booth_06:                    gs_convert_boolean( row[:competitor_booth_06]),
        date_last_emailed_for_service_reminder: gs_convert_date( row[:date_last_emailed_for_service_reminder]),
        do_not_remind_for_service:              gs_convert_boolean( row[:do_not_remind_for_service]),
        state_convention_07:                    gs_convert_boolean( row[:state_convention_07]),
        workshop_07:                            gs_convert_boolean( row[:workshop_07]),
        christmas_card_07:                      gs_convert_boolean( row[:christmas_card_07]),
        christmas_box_07:                       gs_convert_boolean( row[:christmas_box_07]),
        beta_tester:                            gs_convert_boolean( row[:beta_tester]),
        wyoming_training:                       gs_convert_boolean( row[:wyoming_training]),
        recieved_thank_you_from_christmas_box:  gs_convert_boolean( row[:recieved_thank_you_from_christmas_box]),
        eblast_2012_announce:                   gs_convert_boolean( row[:eblast_2012_announce]),
        christmas_2011:                         gs_convert_boolean( row[:christmas_2011]),
        bulk_ne:                                gs_convert_boolean( row[:bulk_ne]),
        fair_id:                                fair_id
      )
    end

    # Bulk import contacts array
    Contact.import contacts
  end
end

