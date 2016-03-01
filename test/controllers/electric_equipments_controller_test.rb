require 'test_helper'

class ElectricEquipmentsControllerTest < ActionController::TestCase
  setup do
    @electric_equipment = electric_equipments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:electric_equipments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create electric_equipment" do
    assert_difference('ElectricEquipment.count') do
      post :create, electric_equipment: { area: @electric_equipment.area, build_date: @electric_equipment.build_date, buy_date: @electric_equipment.buy_date, fire_level: @electric_equipment.fire_level, is_active: @electric_equipment.is_active, last_check_date: @electric_equipment.last_check_date, manage_org: @electric_equipment.manage_org, note: @electric_equipment.note, org_id: @electric_equipment.org_id, pwer: @electric_equipment.pwer, qty: @electric_equipment.qty, work_type: @electric_equipment.work_type }
    end

    assert_redirected_to electric_equipment_path(assigns(:electric_equipment))
  end

  test "should show electric_equipment" do
    get :show, id: @electric_equipment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @electric_equipment
    assert_response :success
  end

  test "should update electric_equipment" do
    patch :update, id: @electric_equipment, electric_equipment: { area: @electric_equipment.area, build_date: @electric_equipment.build_date, buy_date: @electric_equipment.buy_date, fire_level: @electric_equipment.fire_level, is_active: @electric_equipment.is_active, last_check_date: @electric_equipment.last_check_date, manage_org: @electric_equipment.manage_org, note: @electric_equipment.note, org_id: @electric_equipment.org_id, pwer: @electric_equipment.pwer, qty: @electric_equipment.qty, work_type: @electric_equipment.work_type }
    assert_redirected_to electric_equipment_path(assigns(:electric_equipment))
  end

  test "should destroy electric_equipment" do
    assert_difference('ElectricEquipment.count', -1) do
      delete :destroy, id: @electric_equipment
    end

    assert_redirected_to electric_equipments_path
  end
end
