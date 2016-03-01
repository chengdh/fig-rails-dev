require 'test_helper'

class HousesControllerTest < ActionController::TestCase
  setup do
    @house = houses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:houses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create house" do
    assert_difference('House.count') do
      post :create, house: { build_date: @house.build_date, building_area: @house.building_area, have_safe_contract: @house.have_safe_contract, is_active: @house.is_active, is_rent: @house.is_rent, location: @house.location, name: @house.name, note: @house.note, org_id: @house.org_id, rent_to: @house.rent_to, usage: @house.usage }
    end

    assert_redirected_to house_path(assigns(:house))
  end

  test "should show house" do
    get :show, id: @house
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @house
    assert_response :success
  end

  test "should update house" do
    patch :update, id: @house, house: { build_date: @house.build_date, building_area: @house.building_area, have_safe_contract: @house.have_safe_contract, is_active: @house.is_active, is_rent: @house.is_rent, location: @house.location, name: @house.name, note: @house.note, org_id: @house.org_id, rent_to: @house.rent_to, usage: @house.usage }
    assert_redirected_to house_path(assigns(:house))
  end

  test "should destroy house" do
    assert_difference('House.count', -1) do
      delete :destroy, id: @house
    end

    assert_redirected_to houses_path
  end
end
