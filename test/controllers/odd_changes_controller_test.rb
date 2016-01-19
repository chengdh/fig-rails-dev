require 'test_helper'

class OddChangesControllerTest < ActionController::TestCase
  setup do
    @odd_change = odd_changes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:odd_changes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create odd_change" do
    assert_difference('OddChange.count') do
      post :create, odd_change: {  }
    end

    assert_redirected_to odd_change_path(assigns(:odd_change))
  end

  test "should show odd_change" do
    get :show, id: @odd_change
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @odd_change
    assert_response :success
  end

  test "should update odd_change" do
    patch :update, id: @odd_change, odd_change: {  }
    assert_redirected_to odd_change_path(assigns(:odd_change))
  end

  test "should destroy odd_change" do
    assert_difference('OddChange.count', -1) do
      delete :destroy, id: @odd_change
    end

    assert_redirected_to odd_changes_path
  end
end
