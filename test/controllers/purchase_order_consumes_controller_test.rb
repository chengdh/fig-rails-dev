require 'test_helper'

class PurchaseOrderConsumesControllerTest < ActionController::TestCase
  setup do
    @purchase_order_consume = purchase_order_consumes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purchase_order_consumes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purchase_order_consume" do
    assert_difference('PurchaseOrderConsume.count') do
      post :create, purchase_order_consume: {  }
    end

    assert_redirected_to purchase_order_consume_path(assigns(:purchase_order_consume))
  end

  test "should show purchase_order_consume" do
    get :show, id: @purchase_order_consume
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @purchase_order_consume
    assert_response :success
  end

  test "should update purchase_order_consume" do
    patch :update, id: @purchase_order_consume, purchase_order_consume: {  }
    assert_redirected_to purchase_order_consume_path(assigns(:purchase_order_consume))
  end

  test "should destroy purchase_order_consume" do
    assert_difference('PurchaseOrderConsume.count', -1) do
      delete :destroy, id: @purchase_order_consume
    end

    assert_redirected_to purchase_order_consumes_path
  end
end
