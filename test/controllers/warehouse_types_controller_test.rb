require 'test_helper'

class WarehouseTypesControllerTest < ActionController::TestCase
  setup do
    @warehouse_type = warehouse_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:warehouse_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create warehouse_type" do
    assert_difference('WarehouseType.count') do
      post :create, warehouse_type: { is_active: @warehouse_type.is_active, name: @warehouse_type.name, order_by: @warehouse_type.order_by }
    end

    assert_redirected_to warehouse_type_path(assigns(:warehouse_type))
  end

  test "should show warehouse_type" do
    get :show, id: @warehouse_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @warehouse_type
    assert_response :success
  end

  test "should update warehouse_type" do
    patch :update, id: @warehouse_type, warehouse_type: { is_active: @warehouse_type.is_active, name: @warehouse_type.name, order_by: @warehouse_type.order_by }
    assert_redirected_to warehouse_type_path(assigns(:warehouse_type))
  end

  test "should destroy warehouse_type" do
    assert_difference('WarehouseType.count', -1) do
      delete :destroy, id: @warehouse_type
    end

    assert_redirected_to warehouse_types_path
  end
end
