require 'test_helper'

class MoveBillAssetsControllerTest < ActionController::TestCase
  setup do
    @move_bill_asset = move_bill_assets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:move_bill_assets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create move_bill_asset" do
    assert_difference('MoveBillAsset.count') do
      post :create, move_bill_asset: {  }
    end

    assert_redirected_to move_bill_asset_path(assigns(:move_bill_asset))
  end

  test "should show move_bill_asset" do
    get :show, id: @move_bill_asset
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @move_bill_asset
    assert_response :success
  end

  test "should update move_bill_asset" do
    patch :update, id: @move_bill_asset, move_bill_asset: {  }
    assert_redirected_to move_bill_asset_path(assigns(:move_bill_asset))
  end

  test "should destroy move_bill_asset" do
    assert_difference('MoveBillAsset.count', -1) do
      delete :destroy, id: @move_bill_asset
    end

    assert_redirected_to move_bill_assets_path
  end
end
