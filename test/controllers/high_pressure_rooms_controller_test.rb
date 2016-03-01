require 'test_helper'

class HighPressureRoomsControllerTest < ActionController::TestCase
  setup do
    @high_pressure_room = high_pressure_rooms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:high_pressure_rooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create high_pressure_room" do
    assert_difference('HighPressureRoom.count') do
      post :create, high_pressure_room: {  }
    end

    assert_redirected_to high_pressure_room_path(assigns(:high_pressure_room))
  end

  test "should show high_pressure_room" do
    get :show, id: @high_pressure_room
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @high_pressure_room
    assert_response :success
  end

  test "should update high_pressure_room" do
    patch :update, id: @high_pressure_room, high_pressure_room: {  }
    assert_redirected_to high_pressure_room_path(assigns(:high_pressure_room))
  end

  test "should destroy high_pressure_room" do
    assert_difference('HighPressureRoom.count', -1) do
      delete :destroy, id: @high_pressure_room
    end

    assert_redirected_to high_pressure_rooms_path
  end
end
