require 'test_helper'

class WorthlessBillAssetsControllerTest < ActionController::TestCase
  setup do
    @worthless_bill_asset = worthless_bill_assets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:worthless_bill_assets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create worthless_bill_asset" do
    assert_difference('WorthlessBillAsset.count') do
      post :create, worthless_bill_asset: {  }
    end

    assert_redirected_to worthless_bill_asset_path(assigns(:worthless_bill_asset))
  end

  test "should show worthless_bill_asset" do
    get :show, id: @worthless_bill_asset
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @worthless_bill_asset
    assert_response :success
  end

  test "should update worthless_bill_asset" do
    patch :update, id: @worthless_bill_asset, worthless_bill_asset: {  }
    assert_redirected_to worthless_bill_asset_path(assigns(:worthless_bill_asset))
  end

  test "should destroy worthless_bill_asset" do
    assert_difference('WorthlessBillAsset.count', -1) do
      delete :destroy, id: @worthless_bill_asset
    end

    assert_redirected_to worthless_bill_assets_path
  end
end
