require 'test_helper'

class SpecEquipmentsControllerTest < ActionController::TestCase
  setup do
    @spec_equipment = spec_equipments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spec_equipments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spec_equipment" do
    assert_difference('SpecEquipment.count') do
      post :create, spec_equipment: { equip_date: @spec_equipment.equip_date, equip_type: @spec_equipment.equip_type, is_active: @spec_equipment.is_active, last_check_date: @spec_equipment.last_check_date, location: @spec_equipment.location, model: @spec_equipment.model, note: @spec_equipment.note, org_id: @spec_equipment.org_id, ton: @spec_equipment.ton, usage: @spec_equipment.usage, vendor: @spec_equipment.vendor, volume: @spec_equipment.volume }
    end

    assert_redirected_to spec_equipment_path(assigns(:spec_equipment))
  end

  test "should show spec_equipment" do
    get :show, id: @spec_equipment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spec_equipment
    assert_response :success
  end

  test "should update spec_equipment" do
    patch :update, id: @spec_equipment, spec_equipment: { equip_date: @spec_equipment.equip_date, equip_type: @spec_equipment.equip_type, is_active: @spec_equipment.is_active, last_check_date: @spec_equipment.last_check_date, location: @spec_equipment.location, model: @spec_equipment.model, note: @spec_equipment.note, org_id: @spec_equipment.org_id, ton: @spec_equipment.ton, usage: @spec_equipment.usage, vendor: @spec_equipment.vendor, volume: @spec_equipment.volume }
    assert_redirected_to spec_equipment_path(assigns(:spec_equipment))
  end

  test "should destroy spec_equipment" do
    assert_difference('SpecEquipment.count', -1) do
      delete :destroy, id: @spec_equipment
    end

    assert_redirected_to spec_equipments_path
  end
end
