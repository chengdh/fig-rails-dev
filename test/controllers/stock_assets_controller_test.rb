require 'test_helper'

class StockAssetsControllerTest < ActionController::TestCase
  setup do
    @stock_asset = stock_assets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stock_assets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stock_asset" do
    assert_difference('StockAsset.count') do
      post :create, stock_asset: {  }
    end

    assert_redirected_to stock_asset_path(assigns(:stock_asset))
  end

  test "should show stock_asset" do
    get :show, id: @stock_asset
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stock_asset
    assert_response :success
  end

  test "should update stock_asset" do
    patch :update, id: @stock_asset, stock_asset: {  }
    assert_redirected_to stock_asset_path(assigns(:stock_asset))
  end

  test "should destroy stock_asset" do
    assert_difference('StockAsset.count', -1) do
      delete :destroy, id: @stock_asset
    end

    assert_redirected_to stock_assets_path
  end
end
