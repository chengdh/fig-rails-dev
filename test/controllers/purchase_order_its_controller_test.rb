require 'test_helper'

class PurchaseOrderItsControllerTest < ActionController::TestCase
  setup do
    @purchase_order_it = purchase_order_its(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purchase_order_its)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purchase_order_it" do
    assert_difference('PurchaseOrderIt.count') do
      post :create, purchase_order_it: {  }
    end

    assert_redirected_to purchase_order_it_path(assigns(:purchase_order_it))
  end

  test "should show purchase_order_it" do
    get :show, id: @purchase_order_it
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @purchase_order_it
    assert_response :success
  end

  test "should update purchase_order_it" do
    patch :update, id: @purchase_order_it, purchase_order_it: {  }
    assert_redirected_to purchase_order_it_path(assigns(:purchase_order_it))
  end

  test "should destroy purchase_order_it" do
    assert_difference('PurchaseOrderIt.count', -1) do
      delete :destroy, id: @purchase_order_it
    end

    assert_redirected_to purchase_order_its_path
  end
end
