require 'test_helper'

class WifiClientsControllerTest < ActionController::TestCase
  setup do
    @wifi_client = wifi_clients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wifi_clients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wifi_client" do
    assert_difference('WifiClient.count') do
      post :create, wifi_client: { check_date: @wifi_client.check_date, check_opinion: @wifi_client.check_opinion, check_state: @wifi_client.check_state, checker_id: @wifi_client.checker_id, note: @wifi_client.note, org_id: @wifi_client.org_id, submit_date: @wifi_client.submit_date, submitter_id: @wifi_client.submitter_id, table_date: @wifi_client.table_date, user_id: @wifi_client.user_id }
    end

    assert_redirected_to wifi_client_path(assigns(:wifi_client))
  end

  test "should show wifi_client" do
    get :show, id: @wifi_client
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wifi_client
    assert_response :success
  end

  test "should update wifi_client" do
    patch :update, id: @wifi_client, wifi_client: { check_date: @wifi_client.check_date, check_opinion: @wifi_client.check_opinion, check_state: @wifi_client.check_state, checker_id: @wifi_client.checker_id, note: @wifi_client.note, org_id: @wifi_client.org_id, submit_date: @wifi_client.submit_date, submitter_id: @wifi_client.submitter_id, table_date: @wifi_client.table_date, user_id: @wifi_client.user_id }
    assert_redirected_to wifi_client_path(assigns(:wifi_client))
  end

  test "should destroy wifi_client" do
    assert_difference('WifiClient.count', -1) do
      delete :destroy, id: @wifi_client
    end

    assert_redirected_to wifi_clients_path
  end
end
