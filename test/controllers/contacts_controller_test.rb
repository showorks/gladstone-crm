require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  setup do
    @contact = contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact" do
    assert_difference('Contact.count') do
      post :create, contact: { bad_address: @contact.bad_address, beta_tester: @contact.beta_tester, brochure_2004_fall: @contact.brochure_2004_fall, bulk_mail_2000_cd: @contact.bulk_mail_2000_cd, bulk_mail_2003_cd: @contact.bulk_mail_2003_cd, bulk_ne: @contact.bulk_ne, christmas_2011: @contact.christmas_2011, christmas_box_07: @contact.christmas_box_07, christmas_card_07: @contact.christmas_card_07, christmas_card_2004: @contact.christmas_card_2004, christmas_card_2005: @contact.christmas_card_2005, cid: @contact.cid, competitor_booth_06: @contact.competitor_booth_06, contact_active: @contact.contact_active, contact_address: @contact.contact_address, contact_city: @contact.contact_city, contact_country: @contact.contact_country, contact_date_address_last_active: @contact.contact_date_address_last_active, contact_date_registered: @contact.contact_date_registered, contact_email: @contact.contact_email, contact_last_edited: @contact.contact_last_edited, contact_last_mailed: @contact.contact_last_mailed, contact_name: @contact.contact_name, contact_notes: @contact.contact_notes, contact_phone_1: @contact.contact_phone_1, contact_phone_2: @contact.contact_phone_2, contact_phone_cell: @contact.contact_phone_cell, contact_reputation: @contact.contact_reputation, contact_state: @contact.contact_state, contact_zip_code: @contact.contact_zip_code, date_last_emailed_for_service_reminder: @contact.date_last_emailed_for_service_reminder, do_not_mail: @contact.do_not_mail, do_not_remind_for_service: @contact.do_not_remind_for_service, eblast_2012_announce: @contact.eblast_2012_announce, eclassroom_06: @contact.eclassroom_06, excel_workshop_06: @contact.excel_workshop_06, fair_address: @contact.fair_address, fid: @contact.fid, filled_out_form_at_2005_iafe: @contact.filled_out_form_at_2005_iafe, filled_out_form_at_2005_rmfa: @contact.filled_out_form_at_2005_rmfa, flag: @contact.flag, followup: @contact.followup, gift_basket: @contact.gift_basket, iafe_06: @contact.iafe_06, international: @contact.international, nalsrma: @contact.nalsrma, recieved_thank_you_from_christmas_box: @contact.recieved_thank_you_from_christmas_box, showorks_web_contact: @contact.showorks_web_contact, source: @contact.source, state_convention_07: @contact.state_convention_07, sweb_mailout: @contact.sweb_mailout, temp_flag: @contact.temp_flag, to_print: @contact.to_print, to_terrell: @contact.to_terrell, valid_address: @contact.valid_address, workshop_07: @contact.workshop_07, wyoming_training: @contact.wyoming_training }
    end

    assert_redirected_to contact_path(assigns(:contact))
  end

  test "should show contact" do
    get :show, id: @contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contact
    assert_response :success
  end

  test "should update contact" do
    patch :update, id: @contact, contact: { bad_address: @contact.bad_address, beta_tester: @contact.beta_tester, brochure_2004_fall: @contact.brochure_2004_fall, bulk_mail_2000_cd: @contact.bulk_mail_2000_cd, bulk_mail_2003_cd: @contact.bulk_mail_2003_cd, bulk_ne: @contact.bulk_ne, christmas_2011: @contact.christmas_2011, christmas_box_07: @contact.christmas_box_07, christmas_card_07: @contact.christmas_card_07, christmas_card_2004: @contact.christmas_card_2004, christmas_card_2005: @contact.christmas_card_2005, cid: @contact.cid, competitor_booth_06: @contact.competitor_booth_06, contact_active: @contact.contact_active, contact_address: @contact.contact_address, contact_city: @contact.contact_city, contact_country: @contact.contact_country, contact_date_address_last_active: @contact.contact_date_address_last_active, contact_date_registered: @contact.contact_date_registered, contact_email: @contact.contact_email, contact_last_edited: @contact.contact_last_edited, contact_last_mailed: @contact.contact_last_mailed, contact_name: @contact.contact_name, contact_notes: @contact.contact_notes, contact_phone_1: @contact.contact_phone_1, contact_phone_2: @contact.contact_phone_2, contact_phone_cell: @contact.contact_phone_cell, contact_reputation: @contact.contact_reputation, contact_state: @contact.contact_state, contact_zip_code: @contact.contact_zip_code, date_last_emailed_for_service_reminder: @contact.date_last_emailed_for_service_reminder, do_not_mail: @contact.do_not_mail, do_not_remind_for_service: @contact.do_not_remind_for_service, eblast_2012_announce: @contact.eblast_2012_announce, eclassroom_06: @contact.eclassroom_06, excel_workshop_06: @contact.excel_workshop_06, fair_address: @contact.fair_address, fid: @contact.fid, filled_out_form_at_2005_iafe: @contact.filled_out_form_at_2005_iafe, filled_out_form_at_2005_rmfa: @contact.filled_out_form_at_2005_rmfa, flag: @contact.flag, followup: @contact.followup, gift_basket: @contact.gift_basket, iafe_06: @contact.iafe_06, international: @contact.international, nalsrma: @contact.nalsrma, recieved_thank_you_from_christmas_box: @contact.recieved_thank_you_from_christmas_box, showorks_web_contact: @contact.showorks_web_contact, source: @contact.source, state_convention_07: @contact.state_convention_07, sweb_mailout: @contact.sweb_mailout, temp_flag: @contact.temp_flag, to_print: @contact.to_print, to_terrell: @contact.to_terrell, valid_address: @contact.valid_address, workshop_07: @contact.workshop_07, wyoming_training: @contact.wyoming_training }
    assert_redirected_to contact_path(assigns(:contact))
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete :destroy, id: @contact
    end

    assert_redirected_to contacts_path
  end
end
