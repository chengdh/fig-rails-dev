require 'test_helper'

class BasePurchaseOrdersControllerTest < ActionController::TestCase
  setup do
    @base_purchase_order = base_purchase_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:base_purchase_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create base_purchase_order" do
    assert_difference('BasePurchaseOrder.count') do
      post :create, base_purchase_order: { bill_date: @base_purchase_order.bill_date, bill_no: @base_purchase_order.bill_no, confirm_date: @base_purchase_order.confirm_date, confirmer_id: @base_purchase_order.confirmer_id, f_location_id: @base_purchase_order.f_location_id, name: @base_purchase_order.name, note: @base_purchase_order.note, operator: @base_purchase_order.operator, org_id: @base_purchase_order.org_id, state: @base_purchase_order.state, t_location_id: @base_purchase_order.t_location_id, type: @base_purchase_order.type, user_id: @base_purchase_order.user_id }
    end

    assert_redirected_to base_purchase_order_path(assigns(:base_purchase_order))
  end

  test "should show base_purchase_order" do
    get :show, id: @base_purchase_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @base_purchase_order
    assert_response :success
  end

  test "should update base_purchase_order" do
    patch :update, id: @base_purchase_order, base_purchase_order: { bill_date: @base_purchase_order.bill_date, bill_no: @base_purchase_order.bill_no, confirm_date: @base_purchase_order.confirm_date, confirmer_id: @base_purchase_order.confirmer_id, f_location_id: @base_purchase_order.f_location_id, name: @base_purchase_order.name, note: @base_purchase_order.note, operator: @base_purchase_order.operator, org_id: @base_purchase_order.org_id, state: @base_purchase_order.state, t_location_id: @base_purchase_order.t_location_id, type: @base_purchase_order.type, user_id: @base_purchase_order.user_id }
    assert_redirected_to base_purchase_order_path(assigns(:base_purchase_order))
  end

  test "should destroy base_purchase_order" do
    assert_difference('BasePurchaseOrder.count', -1) do
      delete :destroy, id: @base_purchase_order
    end

    assert_redirected_to base_purchase_orders_path
  end
end
