require 'test_helper'

class EquipAssetsControllerTest < ActionController::TestCase
  setup do
    @equip_asset = equip_assets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:equip_assets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create equip_asset" do
    assert_difference('EquipAsset.count') do
      post :create, equip_asset: {  }
    end

    assert_redirected_to equip_asset_path(assigns(:equip_asset))
  end

  test "should show equip_asset" do
    get :show, id: @equip_asset
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @equip_asset
    assert_response :success
  end

  test "should update equip_asset" do
    patch :update, id: @equip_asset, equip_asset: {  }
    assert_redirected_to equip_asset_path(assigns(:equip_asset))
  end

  test "should destroy equip_asset" do
    assert_difference('EquipAsset.count', -1) do
      delete :destroy, id: @equip_asset
    end

    assert_redirected_to equip_assets_path
  end
end
