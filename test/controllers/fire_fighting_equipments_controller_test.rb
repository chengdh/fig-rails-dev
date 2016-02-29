require 'test_helper'

class FireFightingEquipmentsControllerTest < ActionController::TestCase
  setup do
    @fire_fighting_equipment = fire_fighting_equipments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fire_fighting_equipments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fire_fighting_equipment" do
    assert_difference('FireFightingEquipment.count') do
      post :create, fire_fighting_equipment: { duty_person: @fire_fighting_equipment.duty_person, is_active: @fire_fighting_equipment.is_active, last_upkeep_date: @fire_fighting_equipment.last_upkeep_date, location: @fire_fighting_equipment.location, model: @fire_fighting_equipment.model, name: @fire_fighting_equipment.name, note: @fire_fighting_equipment.note, org_id: @fire_fighting_equipment.org_id, out_factory_date: @fire_fighting_equipment.out_factory_date, qty: @fire_fighting_equipment.qty, user_id: @fire_fighting_equipment.user_id, valid_date: @fire_fighting_equipment.valid_date }
    end

    assert_redirected_to fire_fighting_equipment_path(assigns(:fire_fighting_equipment))
  end

  test "should show fire_fighting_equipment" do
    get :show, id: @fire_fighting_equipment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fire_fighting_equipment
    assert_response :success
  end

  test "should update fire_fighting_equipment" do
    patch :update, id: @fire_fighting_equipment, fire_fighting_equipment: { duty_person: @fire_fighting_equipment.duty_person, is_active: @fire_fighting_equipment.is_active, last_upkeep_date: @fire_fighting_equipment.last_upkeep_date, location: @fire_fighting_equipment.location, model: @fire_fighting_equipment.model, name: @fire_fighting_equipment.name, note: @fire_fighting_equipment.note, org_id: @fire_fighting_equipment.org_id, out_factory_date: @fire_fighting_equipment.out_factory_date, qty: @fire_fighting_equipment.qty, user_id: @fire_fighting_equipment.user_id, valid_date: @fire_fighting_equipment.valid_date }
    assert_redirected_to fire_fighting_equipment_path(assigns(:fire_fighting_equipment))
  end

  test "should destroy fire_fighting_equipment" do
    assert_difference('FireFightingEquipment.count', -1) do
      delete :destroy, id: @fire_fighting_equipment
    end

    assert_redirected_to fire_fighting_equipments_path
  end
end
