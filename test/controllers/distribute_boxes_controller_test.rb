require 'test_helper'

class DistributeBoxesControllerTest < ActionController::TestCase
  setup do
    @distribute_box = distribute_boxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:distribute_boxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create distribute_box" do
    assert_difference('DistributeBox.count') do
      post :create, distribute_box: {  }
    end

    assert_redirected_to distribute_box_path(assigns(:distribute_box))
  end

  test "should show distribute_box" do
    get :show, id: @distribute_box
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @distribute_box
    assert_response :success
  end

  test "should update distribute_box" do
    patch :update, id: @distribute_box, distribute_box: {  }
    assert_redirected_to distribute_box_path(assigns(:distribute_box))
  end

  test "should destroy distribute_box" do
    assert_difference('DistributeBox.count', -1) do
      delete :destroy, id: @distribute_box
    end

    assert_redirected_to distribute_boxes_path
  end
end
