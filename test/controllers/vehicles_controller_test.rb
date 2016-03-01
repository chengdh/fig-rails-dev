require 'test_helper'

class VehiclesControllerTest < ActionController::TestCase
  setup do
    @vehicle = vehicles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vehicles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vehicle" do
    assert_difference('Vehicle.count') do
      post :create, vehicle: { buy_date: @vehicle.buy_date, expire_date: @vehicle.expire_date, is_active: @vehicle.is_active, last_check_date: @vehicle.last_check_date, license_no: @vehicle.license_no, model: @vehicle.model, note: @vehicle.note, register_no: @vehicle.register_no, vehicle_no: @vehicle.vehicle_no }
    end

    assert_redirected_to vehicle_path(assigns(:vehicle))
  end

  test "should show vehicle" do
    get :show, id: @vehicle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vehicle
    assert_response :success
  end

  test "should update vehicle" do
    patch :update, id: @vehicle, vehicle: { buy_date: @vehicle.buy_date, expire_date: @vehicle.expire_date, is_active: @vehicle.is_active, last_check_date: @vehicle.last_check_date, license_no: @vehicle.license_no, model: @vehicle.model, note: @vehicle.note, register_no: @vehicle.register_no, vehicle_no: @vehicle.vehicle_no }
    assert_redirected_to vehicle_path(assigns(:vehicle))
  end

  test "should destroy vehicle" do
    assert_difference('Vehicle.count', -1) do
      delete :destroy, id: @vehicle
    end

    assert_redirected_to vehicles_path
  end
end
