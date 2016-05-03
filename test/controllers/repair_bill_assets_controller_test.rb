require 'test_helper'

class RepairBillAssetsControllerTest < ActionController::TestCase
  setup do
    @repair_bill_asset = repair_bill_assets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:repair_bill_assets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create repair_bill_asset" do
    assert_difference('RepairBillAsset.count') do
      post :create, repair_bill_asset: {  }
    end

    assert_redirected_to repair_bill_asset_path(assigns(:repair_bill_asset))
  end

  test "should show repair_bill_asset" do
    get :show, id: @repair_bill_asset
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @repair_bill_asset
    assert_response :success
  end

  test "should update repair_bill_asset" do
    patch :update, id: @repair_bill_asset, repair_bill_asset: {  }
    assert_redirected_to repair_bill_asset_path(assigns(:repair_bill_asset))
  end

  test "should destroy repair_bill_asset" do
    assert_difference('RepairBillAsset.count', -1) do
      delete :destroy, id: @repair_bill_asset
    end

    assert_redirected_to repair_bill_assets_path
  end
end
