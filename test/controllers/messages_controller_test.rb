require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  setup do
    @message = messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create message" do
    assert_difference('Message.count') do
      post :create, message: { cid: @message.cid, iid: @message.iid, incident_charge: @message.incident_charge, incident_closed: @message.incident_closed, incident_date: @message.incident_date, incident_follow_up_date: @message.incident_follow_up_date, incident_memo: @message.incident_memo, incident_type: @message.incident_type }
    end

    assert_redirected_to message_path(assigns(:message))
  end

  test "should show message" do
    get :show, id: @message
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @message
    assert_response :success
  end

  test "should update message" do
    patch :update, id: @message, message: { cid: @message.cid, iid: @message.iid, incident_charge: @message.incident_charge, incident_closed: @message.incident_closed, incident_date: @message.incident_date, incident_follow_up_date: @message.incident_follow_up_date, incident_memo: @message.incident_memo, incident_type: @message.incident_type }
    assert_redirected_to message_path(assigns(:message))
  end

  test "should destroy message" do
    assert_difference('Message.count', -1) do
      delete :destroy, id: @message
    end

    assert_redirected_to messages_path
  end
end
