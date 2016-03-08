require 'test_helper'

class RepairBillsControllerTest < ActionController::TestCase
  setup do
    @repair_bill = repair_bills(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:repair_bills)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create repair_bill" do
    assert_difference('RepairBill.count') do
      post :create, repair_bill: {  }
    end

    assert_redirected_to repair_bill_path(assigns(:repair_bill))
  end

  test "should show repair_bill" do
    get :show, id: @repair_bill
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @repair_bill
    assert_response :success
  end

  test "should update repair_bill" do
    patch :update, id: @repair_bill, repair_bill: {  }
    assert_redirected_to repair_bill_path(assigns(:repair_bill))
  end

  test "should destroy repair_bill" do
    assert_difference('RepairBill.count', -1) do
      delete :destroy, id: @repair_bill
    end

    assert_redirected_to repair_bills_path
  end
end
