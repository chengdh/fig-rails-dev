require 'test_helper'

class ShippmentAssetsControllerTest < ActionController::TestCase
  setup do
    @shippment_asset = shippment_assets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shippment_assets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shippment_asset" do
    assert_difference('ShippmentAsset.count') do
      post :create, shippment_asset: {  }
    end

    assert_redirected_to shippment_asset_path(assigns(:shippment_asset))
  end

  test "should show shippment_asset" do
    get :show, id: @shippment_asset
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shippment_asset
    assert_response :success
  end

  test "should update shippment_asset" do
    patch :update, id: @shippment_asset, shippment_asset: {  }
    assert_redirected_to shippment_asset_path(assigns(:shippment_asset))
  end

  test "should destroy shippment_asset" do
    assert_difference('ShippmentAsset.count', -1) do
      delete :destroy, id: @shippment_asset
    end

    assert_redirected_to shippment_assets_path
  end
end
