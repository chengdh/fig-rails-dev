require 'test_helper'

class EquipConsumesControllerTest < ActionController::TestCase
  setup do
    @equip_consume = equip_consumes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:equip_consumes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create equip_consume" do
    assert_difference('EquipConsume.count') do
      post :create, equip_consume: {  }
    end

    assert_redirected_to equip_consume_path(assigns(:equip_consume))
  end

  test "should show equip_consume" do
    get :show, id: @equip_consume
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @equip_consume
    assert_response :success
  end

  test "should update equip_consume" do
    patch :update, id: @equip_consume, equip_consume: {  }
    assert_redirected_to equip_consume_path(assigns(:equip_consume))
  end

  test "should destroy equip_consume" do
    assert_difference('EquipConsume.count', -1) do
      delete :destroy, id: @equip_consume
    end

    assert_redirected_to equip_consumes_path
  end
end
