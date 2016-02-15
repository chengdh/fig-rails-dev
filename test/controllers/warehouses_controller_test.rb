require 'test_helper'

class WarehousesControllerTest < ActionController::TestCase
  setup do
    @warehouse = warehouses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:warehouses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create warehouse" do
    assert_difference('Warehouse.count') do
      post :create, warehouse: { address: @warehouse.address, area: @warehouse.area, default_location_id: @warehouse.default_location_id, is_active: @warehouse.is_active, leader: @warehouse.leader, name: @warehouse.name, note: @warehouse.note, order_by: @warehouse.order_by, org_id: @warehouse.org_id, phone: @warehouse.phone, volume: @warehouse.volume, warehouse_type_id: @warehouse.warehouse_type_id }
    end

    assert_redirected_to warehouse_path(assigns(:warehouse))
  end

  test "should show warehouse" do
    get :show, id: @warehouse
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @warehouse
    assert_response :success
  end

  test "should update warehouse" do
    patch :update, id: @warehouse, warehouse: { address: @warehouse.address, area: @warehouse.area, default_location_id: @warehouse.default_location_id, is_active: @warehouse.is_active, leader: @warehouse.leader, name: @warehouse.name, note: @warehouse.note, order_by: @warehouse.order_by, org_id: @warehouse.org_id, phone: @warehouse.phone, volume: @warehouse.volume, warehouse_type_id: @warehouse.warehouse_type_id }
    assert_redirected_to warehouse_path(assigns(:warehouse))
  end

  test "should destroy warehouse" do
    assert_difference('Warehouse.count', -1) do
      delete :destroy, id: @warehouse
    end

    assert_redirected_to warehouses_path
  end
end
