require 'test_helper'

class PurchaseOrderVirtualsControllerTest < ActionController::TestCase
  setup do
    @purchase_order_virtual = purchase_order_virtuals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purchase_order_virtuals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purchase_order_virtual" do
    assert_difference('PurchaseOrderVirtual.count') do
      post :create, purchase_order_virtual: {  }
    end

    assert_redirected_to purchase_order_virtual_path(assigns(:purchase_order_virtual))
  end

  test "should show purchase_order_virtual" do
    get :show, id: @purchase_order_virtual
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @purchase_order_virtual
    assert_response :success
  end

  test "should update purchase_order_virtual" do
    patch :update, id: @purchase_order_virtual, purchase_order_virtual: {  }
    assert_redirected_to purchase_order_virtual_path(assigns(:purchase_order_virtual))
  end

  test "should destroy purchase_order_virtual" do
    assert_difference('PurchaseOrderVirtual.count', -1) do
      delete :destroy, id: @purchase_order_virtual
    end

    assert_redirected_to purchase_order_virtuals_path
  end
end
