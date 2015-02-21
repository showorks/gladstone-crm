require 'test_helper'

class FairsControllerTest < ActionController::TestCase
  setup do
    @fair = fairs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fairs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fair" do
    assert_difference('Fair.count') do
      post :create, fair: { bulk_ne: @fair.bulk_ne, christmas_2010: @fair.christmas_2010, christmas_2011: @fair.christmas_2011, converted_from_competition: @fair.converted_from_competition, courtesy_late_pmt: @fair.courtesy_late_pmt, fair_name: @fair.fair_name, fair_notes: @fair.fair_notes, fair_state: @fair.fair_state, fair_time: @fair.fair_time, feather_in_hat: @fair.feather_in_hat, fid: @fair.fid, free_upgrade: @fair.free_upgrade, incidents_remaining: @fair.incidents_remaining, international: @fair.international, is_fair: @fair.is_fair, judas: @fair.judas, mailed_2012_invoice: @fair.mailed_2012_invoice, old_service_plan_ended: @fair.old_service_plan_ended, old_service_plan_number: @fair.old_service_plan_number, poor_payment: @fair.poor_payment, processed_2012: @fair.processed_2012, purchased: @fair.purchased, returned_product: @fair.returned_product, service_plan_number: @fair.service_plan_number, showorks_web_user: @fair.showorks_web_user, temp_flag: @fair.temp_flag, video_key: @fair.video_key, video_key_2006: @fair.video_key_2006, video_key_2009: @fair.video_key_2009 }
    end

    assert_redirected_to fair_path(assigns(:fair))
  end

  test "should show fair" do
    get :show, id: @fair
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fair
    assert_response :success
  end

  test "should update fair" do
    patch :update, id: @fair, fair: { bulk_ne: @fair.bulk_ne, christmas_2010: @fair.christmas_2010, christmas_2011: @fair.christmas_2011, converted_from_competition: @fair.converted_from_competition, courtesy_late_pmt: @fair.courtesy_late_pmt, fair_name: @fair.fair_name, fair_notes: @fair.fair_notes, fair_state: @fair.fair_state, fair_time: @fair.fair_time, feather_in_hat: @fair.feather_in_hat, fid: @fair.fid, free_upgrade: @fair.free_upgrade, incidents_remaining: @fair.incidents_remaining, international: @fair.international, is_fair: @fair.is_fair, judas: @fair.judas, mailed_2012_invoice: @fair.mailed_2012_invoice, old_service_plan_ended: @fair.old_service_plan_ended, old_service_plan_number: @fair.old_service_plan_number, poor_payment: @fair.poor_payment, processed_2012: @fair.processed_2012, purchased: @fair.purchased, returned_product: @fair.returned_product, service_plan_number: @fair.service_plan_number, showorks_web_user: @fair.showorks_web_user, temp_flag: @fair.temp_flag, video_key: @fair.video_key, video_key_2006: @fair.video_key_2006, video_key_2009: @fair.video_key_2009 }
    assert_redirected_to fair_path(assigns(:fair))
  end

  test "should destroy fair" do
    assert_difference('Fair.count', -1) do
      delete :destroy, id: @fair
    end

    assert_redirected_to fairs_path
  end
end
