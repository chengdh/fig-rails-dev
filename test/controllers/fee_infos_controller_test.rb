require 'test_helper'

class FeeInfosControllerTest < ActionController::TestCase
  setup do
    @fee_info = fee_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fee_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fee_info" do
    assert_difference('FeeInfo.count') do
      post :create, fee_info: { cr: @fee_info.cr, dr: @fee_info.dr, fee_date: @fee_info.fee_date, note: @fee_info.note, user_id: @fee_info.user_id }
    end

    assert_redirected_to fee_info_path(assigns(:fee_info))
  end

  test "should show fee_info" do
    get :show, id: @fee_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fee_info
    assert_response :success
  end

  test "should update fee_info" do
    patch :update, id: @fee_info, fee_info: { cr: @fee_info.cr, dr: @fee_info.dr, fee_date: @fee_info.fee_date, note: @fee_info.note, user_id: @fee_info.user_id }
    assert_redirected_to fee_info_path(assigns(:fee_info))
  end

  test "should destroy fee_info" do
    assert_difference('FeeInfo.count', -1) do
      delete :destroy, id: @fee_info
    end

    assert_redirected_to fee_infos_path
  end
end
