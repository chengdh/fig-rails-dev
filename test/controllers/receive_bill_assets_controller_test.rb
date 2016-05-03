require 'test_helper'

class ReceiveBillAssetsControllerTest < ActionController::TestCase
  setup do
    @receive_bill_asset = receive_bill_assets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receive_bill_assets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create receive_bill_asset" do
    assert_difference('ReceiveBillAsset.count') do
      post :create, receive_bill_asset: {  }
    end

    assert_redirected_to receive_bill_asset_path(assigns(:receive_bill_asset))
  end

  test "should show receive_bill_asset" do
    get :show, id: @receive_bill_asset
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @receive_bill_asset
    assert_response :success
  end

  test "should update receive_bill_asset" do
    patch :update, id: @receive_bill_asset, receive_bill_asset: {  }
    assert_redirected_to receive_bill_asset_path(assigns(:receive_bill_asset))
  end

  test "should destroy receive_bill_asset" do
    assert_difference('ReceiveBillAsset.count', -1) do
      delete :destroy, id: @receive_bill_asset
    end

    assert_redirected_to receive_bill_assets_path
  end
end
