require 'test_helper'

class IpInfoHeadersControllerTest < ActionController::TestCase
  setup do
    @ip_info_header = ip_info_headers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ip_info_headers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ip_info_header" do
    assert_difference('IpInfoHeader.count') do
      post :create, ip_info_header: { note: @ip_info_header.note, org_id: @ip_info_header.org_id, state: @ip_info_header.state, user_id: @ip_info_header.user_id }
    end

    assert_redirected_to ip_info_header_path(assigns(:ip_info_header))
  end

  test "should show ip_info_header" do
    get :show, id: @ip_info_header
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ip_info_header
    assert_response :success
  end

  test "should update ip_info_header" do
    patch :update, id: @ip_info_header, ip_info_header: { note: @ip_info_header.note, org_id: @ip_info_header.org_id, state: @ip_info_header.state, user_id: @ip_info_header.user_id }
    assert_redirected_to ip_info_header_path(assigns(:ip_info_header))
  end

  test "should destroy ip_info_header" do
    assert_difference('IpInfoHeader.count', -1) do
      delete :destroy, id: @ip_info_header
    end

    assert_redirected_to ip_info_headers_path
  end
end
