require 'test_helper'

class SpecWarehousesControllerTest < ActionController::TestCase
  setup do
    @spec_warehouse = spec_warehouses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spec_warehouses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spec_warehouse" do
    assert_difference('SpecWarehouse.count') do
      post :create, spec_warehouse: { act_volume: @spec_warehouse.act_volume, build_date: @spec_warehouse.build_date, building_area: @spec_warehouse.building_area, fire_level: @spec_warehouse.fire_level, is_active: @spec_warehouse.is_active, is_auto_fire_fighting_system: @spec_warehouse.is_auto_fire_fighting_system, is_camera_moniter: @spec_warehouse.is_camera_moniter, is_fire_fighting_alarm_system: @spec_warehouse.is_fire_fighting_alarm_system, is_fire_hydrant_system: @spec_warehouse.is_fire_hydrant_system, is_lightning_protector: @spec_warehouse.is_lightning_protector, location: @spec_warehouse.location, max_volume: @spec_warehouse.max_volume, name: @spec_warehouse.name, note: @spec_warehouse.note, org_id: @spec_warehouse.org_id, room_count: @spec_warehouse.room_count, warehouse_type: @spec_warehouse.warehouse_type }
    end

    assert_redirected_to spec_warehouse_path(assigns(:spec_warehouse))
  end

  test "should show spec_warehouse" do
    get :show, id: @spec_warehouse
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spec_warehouse
    assert_response :success
  end

  test "should update spec_warehouse" do
    patch :update, id: @spec_warehouse, spec_warehouse: { act_volume: @spec_warehouse.act_volume, build_date: @spec_warehouse.build_date, building_area: @spec_warehouse.building_area, fire_level: @spec_warehouse.fire_level, is_active: @spec_warehouse.is_active, is_auto_fire_fighting_system: @spec_warehouse.is_auto_fire_fighting_system, is_camera_moniter: @spec_warehouse.is_camera_moniter, is_fire_fighting_alarm_system: @spec_warehouse.is_fire_fighting_alarm_system, is_fire_hydrant_system: @spec_warehouse.is_fire_hydrant_system, is_lightning_protector: @spec_warehouse.is_lightning_protector, location: @spec_warehouse.location, max_volume: @spec_warehouse.max_volume, name: @spec_warehouse.name, note: @spec_warehouse.note, org_id: @spec_warehouse.org_id, room_count: @spec_warehouse.room_count, warehouse_type: @spec_warehouse.warehouse_type }
    assert_redirected_to spec_warehouse_path(assigns(:spec_warehouse))
  end

  test "should destroy spec_warehouse" do
    assert_difference('SpecWarehouse.count', -1) do
      delete :destroy, id: @spec_warehouse
    end

    assert_redirected_to spec_warehouses_path
  end
end
