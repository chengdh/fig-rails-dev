require 'test_helper'

class InoutBillsControllerTest < ActionController::TestCase
  setup do
    @inout_bill = inout_bills(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inout_bills)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inout_bill" do
    assert_difference('InoutBill.count') do
      post :create, inout_bill: { bill_date: @inout_bill.bill_date, f_location_id: @inout_bill.f_location_id, note: @inout_bill.note, operater: @inout_bill.operater, state: @inout_bill.state, t_location_id: @inout_bill.t_location_id, type: @inout_bill.type, user_id: @inout_bill.user_id }
    end

    assert_redirected_to inout_bill_path(assigns(:inout_bill))
  end

  test "should show inout_bill" do
    get :show, id: @inout_bill
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inout_bill
    assert_response :success
  end

  test "should update inout_bill" do
    patch :update, id: @inout_bill, inout_bill: { bill_date: @inout_bill.bill_date, f_location_id: @inout_bill.f_location_id, note: @inout_bill.note, operater: @inout_bill.operater, state: @inout_bill.state, t_location_id: @inout_bill.t_location_id, type: @inout_bill.type, user_id: @inout_bill.user_id }
    assert_redirected_to inout_bill_path(assigns(:inout_bill))
  end

  test "should destroy inout_bill" do
    assert_difference('InoutBill.count', -1) do
      delete :destroy, id: @inout_bill
    end

    assert_redirected_to inout_bills_path
  end
end
