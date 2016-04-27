require 'test_helper'

class EquipVirtualsControllerTest < ActionController::TestCase
  setup do
    @equip_virtual = equip_virtuals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:equip_virtuals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create equip_virtual" do
    assert_difference('EquipVirtual.count') do
      post :create, equip_virtual: {  }
    end

    assert_redirected_to equip_virtual_path(assigns(:equip_virtual))
  end

  test "should show equip_virtual" do
    get :show, id: @equip_virtual
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @equip_virtual
    assert_response :success
  end

  test "should update equip_virtual" do
    patch :update, id: @equip_virtual, equip_virtual: {  }
    assert_redirected_to equip_virtual_path(assigns(:equip_virtual))
  end

  test "should destroy equip_virtual" do
    assert_difference('EquipVirtual.count', -1) do
      delete :destroy, id: @equip_virtual
    end

    assert_redirected_to equip_virtuals_path
  end
end
