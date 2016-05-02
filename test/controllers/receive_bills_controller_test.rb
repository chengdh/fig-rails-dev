require 'test_helper'

class ReceiveBillsControllerTest < ActionController::TestCase
  setup do
    @receive_bill = receive_bills(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receive_bills)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create receive_bill" do
    assert_difference('ReceiveBill.count') do
      post :create, receive_bill: {  }
    end

    assert_redirected_to receive_bill_path(assigns(:receive_bill))
  end

  test "should show receive_bill" do
    get :show, id: @receive_bill
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @receive_bill
    assert_response :success
  end

  test "should update receive_bill" do
    patch :update, id: @receive_bill, receive_bill: {  }
    assert_redirected_to receive_bill_path(assigns(:receive_bill))
  end

  test "should destroy receive_bill" do
    assert_difference('ReceiveBill.count', -1) do
      delete :destroy, id: @receive_bill
    end

    assert_redirected_to receive_bills_path
  end
end
