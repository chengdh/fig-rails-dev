require 'test_helper'

class AccidentHeadersControllerTest < ActionController::TestCase
  setup do
    @accident_header = accident_headers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accident_headers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accident_header" do
    assert_difference('AccidentHeader.count') do
      post :create, accident_header: { mth: @accident_header.mth, note: @accident_header.note, org_id: @accident_header.org_id, table_date: @accident_header.table_date, user_id: @accident_header.user_id }
    end

    assert_redirected_to accident_header_path(assigns(:accident_header))
  end

  test "should show accident_header" do
    get :show, id: @accident_header
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @accident_header
    assert_response :success
  end

  test "should update accident_header" do
    patch :update, id: @accident_header, accident_header: { mth: @accident_header.mth, note: @accident_header.note, org_id: @accident_header.org_id, table_date: @accident_header.table_date, user_id: @accident_header.user_id }
    assert_redirected_to accident_header_path(assigns(:accident_header))
  end

  test "should destroy accident_header" do
    assert_difference('AccidentHeader.count', -1) do
      delete :destroy, id: @accident_header
    end

    assert_redirected_to accident_headers_path
  end
end
