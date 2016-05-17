require 'test_helper'

class VerifySmsControllerTest < ActionController::TestCase
  setup do
    @verify_sm = verify_sms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:verify_sms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create verify_sm" do
    assert_difference('VerifySm.count') do
      post :create, verify_sm: { is_used: @verify_sm.is_used, mobile: @verify_sm.mobile, verify_code: @verify_sm.verify_code, verity_type: @verify_sm.verity_type }
    end

    assert_redirected_to verify_sm_path(assigns(:verify_sm))
  end

  test "should show verify_sm" do
    get :show, id: @verify_sm
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @verify_sm
    assert_response :success
  end

  test "should update verify_sm" do
    patch :update, id: @verify_sm, verify_sm: { is_used: @verify_sm.is_used, mobile: @verify_sm.mobile, verify_code: @verify_sm.verify_code, verity_type: @verify_sm.verity_type }
    assert_redirected_to verify_sm_path(assigns(:verify_sm))
  end

  test "should destroy verify_sm" do
    assert_difference('VerifySm.count', -1) do
      delete :destroy, id: @verify_sm
    end

    assert_redirected_to verify_sms_path
  end
end
