require 'test_helper'

class CompanyVpnsControllerTest < ActionController::TestCase
  setup do
    @company_vpn = company_vpns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_vpns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company_vpn" do
    assert_difference('CompanyVpn.count') do
      post :create, company_vpn: { check_date: @company_vpn.check_date, check_opinion: @company_vpn.check_opinion, check_state: @company_vpn.check_state, checker_id: @company_vpn.checker_id, note: @company_vpn.note, org_id: @company_vpn.org_id, submit_date: @company_vpn.submit_date, submit_note: @company_vpn.submit_note, submitter_id: @company_vpn.submitter_id, table_date: @company_vpn.table_date, user_id: @company_vpn.user_id }
    end

    assert_redirected_to company_vpn_path(assigns(:company_vpn))
  end

  test "should show company_vpn" do
    get :show, id: @company_vpn
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company_vpn
    assert_response :success
  end

  test "should update company_vpn" do
    patch :update, id: @company_vpn, company_vpn: { check_date: @company_vpn.check_date, check_opinion: @company_vpn.check_opinion, check_state: @company_vpn.check_state, checker_id: @company_vpn.checker_id, note: @company_vpn.note, org_id: @company_vpn.org_id, submit_date: @company_vpn.submit_date, submit_note: @company_vpn.submit_note, submitter_id: @company_vpn.submitter_id, table_date: @company_vpn.table_date, user_id: @company_vpn.user_id }
    assert_redirected_to company_vpn_path(assigns(:company_vpn))
  end

  test "should destroy company_vpn" do
    assert_difference('CompanyVpn.count', -1) do
      delete :destroy, id: @company_vpn
    end

    assert_redirected_to company_vpns_path
  end
end
