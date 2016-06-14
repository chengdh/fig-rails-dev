require 'test_helper'

class VpnInfosControllerTest < ActionController::TestCase
  setup do
    @vpn_info = vpn_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vpn_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vpn_info" do
    assert_difference('VpnInfo.count') do
      post :create, vpn_info: { check_date: @vpn_info.check_date, check_opinion: @vpn_info.check_opinion, check_state: @vpn_info.check_state, checker_id: @vpn_info.checker_id, note: @vpn_info.note, org_id: @vpn_info.org_id, submit_date: @vpn_info.submit_date, submit_note: @vpn_info.submit_note, submitter_id: @vpn_info.submitter_id, table_date: @vpn_info.table_date, user_id: @vpn_info.user_id }
    end

    assert_redirected_to vpn_info_path(assigns(:vpn_info))
  end

  test "should show vpn_info" do
    get :show, id: @vpn_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vpn_info
    assert_response :success
  end

  test "should update vpn_info" do
    patch :update, id: @vpn_info, vpn_info: { check_date: @vpn_info.check_date, check_opinion: @vpn_info.check_opinion, check_state: @vpn_info.check_state, checker_id: @vpn_info.checker_id, note: @vpn_info.note, org_id: @vpn_info.org_id, submit_date: @vpn_info.submit_date, submit_note: @vpn_info.submit_note, submitter_id: @vpn_info.submitter_id, table_date: @vpn_info.table_date, user_id: @vpn_info.user_id }
    assert_redirected_to vpn_info_path(assigns(:vpn_info))
  end

  test "should destroy vpn_info" do
    assert_difference('VpnInfo.count', -1) do
      delete :destroy, id: @vpn_info
    end

    assert_redirected_to vpn_infos_path
  end
end
