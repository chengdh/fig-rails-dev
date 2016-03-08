require 'test_helper'

class MoveBillsControllerTest < ActionController::TestCase
  setup do
    @move_bill = move_bills(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:move_bills)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create move_bill" do
    assert_difference('MoveBill.count') do
      post :create, move_bill: {  }
    end

    assert_redirected_to move_bill_path(assigns(:move_bill))
  end

  test "should show move_bill" do
    get :show, id: @move_bill
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @move_bill
    assert_response :success
  end

  test "should update move_bill" do
    patch :update, id: @move_bill, move_bill: {  }
    assert_redirected_to move_bill_path(assigns(:move_bill))
  end

  test "should destroy move_bill" do
    assert_difference('MoveBill.count', -1) do
      delete :destroy, id: @move_bill
    end

    assert_redirected_to move_bills_path
  end
end
