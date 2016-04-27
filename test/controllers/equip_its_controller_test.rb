require 'test_helper'

class EquipItsControllerTest < ActionController::TestCase
  setup do
    @equip_it = equip_its(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:equip_its)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create equip_it" do
    assert_difference('EquipIt.count') do
      post :create, equip_it: {  }
    end

    assert_redirected_to equip_it_path(assigns(:equip_it))
  end

  test "should show equip_it" do
    get :show, id: @equip_it
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @equip_it
    assert_response :success
  end

  test "should update equip_it" do
    patch :update, id: @equip_it, equip_it: {  }
    assert_redirected_to equip_it_path(assigns(:equip_it))
  end

  test "should destroy equip_it" do
    assert_difference('EquipIt.count', -1) do
      delete :destroy, id: @equip_it
    end

    assert_redirected_to equip_its_path
  end
end
