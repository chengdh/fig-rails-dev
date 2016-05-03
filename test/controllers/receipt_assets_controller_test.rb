require 'test_helper'

class ReceiptAssetsControllerTest < ActionController::TestCase
  setup do
    @receipt_asset = receipt_assets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receipt_assets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create receipt_asset" do
    assert_difference('ReceiptAsset.count') do
      post :create, receipt_asset: {  }
    end

    assert_redirected_to receipt_asset_path(assigns(:receipt_asset))
  end

  test "should show receipt_asset" do
    get :show, id: @receipt_asset
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @receipt_asset
    assert_response :success
  end

  test "should update receipt_asset" do
    patch :update, id: @receipt_asset, receipt_asset: {  }
    assert_redirected_to receipt_asset_path(assigns(:receipt_asset))
  end

  test "should destroy receipt_asset" do
    assert_difference('ReceiptAsset.count', -1) do
      delete :destroy, id: @receipt_asset
    end

    assert_redirected_to receipt_assets_path
  end
end
