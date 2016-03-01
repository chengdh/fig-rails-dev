require 'test_helper'

class ProtectEquipmentCategoriesControllerTest < ActionController::TestCase
  setup do
    @protect_equipment_category = protect_equipment_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:protect_equipment_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create protect_equipment_category" do
    assert_difference('ProtectEquipmentCategory.count') do
      post :create, protect_equipment_category: { is_active: @protect_equipment_category.is_active, name: @protect_equipment_category.name, order_by: @protect_equipment_category.order_by }
    end

    assert_redirected_to protect_equipment_category_path(assigns(:protect_equipment_category))
  end

  test "should show protect_equipment_category" do
    get :show, id: @protect_equipment_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @protect_equipment_category
    assert_response :success
  end

  test "should update protect_equipment_category" do
    patch :update, id: @protect_equipment_category, protect_equipment_category: { is_active: @protect_equipment_category.is_active, name: @protect_equipment_category.name, order_by: @protect_equipment_category.order_by }
    assert_redirected_to protect_equipment_category_path(assigns(:protect_equipment_category))
  end

  test "should destroy protect_equipment_category" do
    assert_difference('ProtectEquipmentCategory.count', -1) do
      delete :destroy, id: @protect_equipment_category
    end

    assert_redirected_to protect_equipment_categories_path
  end
end
