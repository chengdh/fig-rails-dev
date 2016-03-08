require 'test_helper'

class WorthlessBillsControllerTest < ActionController::TestCase
  setup do
    @worthless_bill = worthless_bills(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:worthless_bills)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create worthless_bill" do
    assert_difference('WorthlessBill.count') do
      post :create, worthless_bill: {  }
    end

    assert_redirected_to worthless_bill_path(assigns(:worthless_bill))
  end

  test "should show worthless_bill" do
    get :show, id: @worthless_bill
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @worthless_bill
    assert_response :success
  end

  test "should update worthless_bill" do
    patch :update, id: @worthless_bill, worthless_bill: {  }
    assert_redirected_to worthless_bill_path(assigns(:worthless_bill))
  end

  test "should destroy worthless_bill" do
    assert_difference('WorthlessBill.count', -1) do
      delete :destroy, id: @worthless_bill
    end

    assert_redirected_to worthless_bills_path
  end
end
