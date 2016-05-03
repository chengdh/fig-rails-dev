require 'test_helper'

class PurchaseOrderAssetsControllerTest < ActionController::TestCase
  setup do
    @purchase_order_asset = purchase_order_assets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purchase_order_assets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purchase_order_asset" do
    assert_difference('PurchaseOrderAsset.count') do
      post :create, purchase_order_asset: {  }
    end

    assert_redirected_to purchase_order_asset_path(assigns(:purchase_order_asset))
  end

  test "should show purchase_order_asset" do
    get :show, id: @purchase_order_asset
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @purchase_order_asset
    assert_response :success
  end

  test "should update purchase_order_asset" do
    patch :update, id: @purchase_order_asset, purchase_order_asset: {  }
    assert_redirected_to purchase_order_asset_path(assigns(:purchase_order_asset))
  end

  test "should destroy purchase_order_asset" do
    assert_difference('PurchaseOrderAsset.count', -1) do
      delete :destroy, id: @purchase_order_asset
    end

    assert_redirected_to purchase_order_assets_path
  end
end
