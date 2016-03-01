require 'test_helper'

class ProtectEquipmentsControllerTest < ActionController::TestCase
  setup do
    @protect_equipment = protect_equipments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:protect_equipments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create protect_equipment" do
    assert_difference('ProtectEquipment.count') do
      post :create, protect_equipment: { deliver_org_id: @protect_equipment.deliver_org_id, is_active: @protect_equipment.is_active, maintain_days: @protect_equipment.maintain_days, name: @protect_equipment.name, note: @protect_equipment.note, org_id: @protect_equipment.org_id, post: @protect_equipment.post, protect_equipment_category_id: @protect_equipment.protect_equipment_category_id, qty: @protect_equipment.qty, save_days: @protect_equipment.save_days, unit_id: @protect_equipment.unit_id }
    end

    assert_redirected_to protect_equipment_path(assigns(:protect_equipment))
  end

  test "should show protect_equipment" do
    get :show, id: @protect_equipment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @protect_equipment
    assert_response :success
  end

  test "should update protect_equipment" do
    patch :update, id: @protect_equipment, protect_equipment: { deliver_org_id: @protect_equipment.deliver_org_id, is_active: @protect_equipment.is_active, maintain_days: @protect_equipment.maintain_days, name: @protect_equipment.name, note: @protect_equipment.note, org_id: @protect_equipment.org_id, post: @protect_equipment.post, protect_equipment_category_id: @protect_equipment.protect_equipment_category_id, qty: @protect_equipment.qty, save_days: @protect_equipment.save_days, unit_id: @protect_equipment.unit_id }
    assert_redirected_to protect_equipment_path(assigns(:protect_equipment))
  end

  test "should destroy protect_equipment" do
    assert_difference('ProtectEquipment.count', -1) do
      delete :destroy, id: @protect_equipment
    end

    assert_redirected_to protect_equipments_path
  end
end
