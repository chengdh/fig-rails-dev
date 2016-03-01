require 'test_helper'

class LowPressureRoomsControllerTest < ActionController::TestCase
  setup do
    @low_pressure_room = low_pressure_rooms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:low_pressure_rooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create low_pressure_room" do
    assert_difference('LowPressureRoom.count') do
      post :create, low_pressure_room: {  }
    end

    assert_redirected_to low_pressure_room_path(assigns(:low_pressure_room))
  end

  test "should show low_pressure_room" do
    get :show, id: @low_pressure_room
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @low_pressure_room
    assert_response :success
  end

  test "should update low_pressure_room" do
    patch :update, id: @low_pressure_room, low_pressure_room: {  }
    assert_redirected_to low_pressure_room_path(assigns(:low_pressure_room))
  end

  test "should destroy low_pressure_room" do
    assert_difference('LowPressureRoom.count', -1) do
      delete :destroy, id: @low_pressure_room
    end

    assert_redirected_to low_pressure_rooms_path
  end
end
