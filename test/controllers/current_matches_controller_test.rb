require 'test_helper'

class CurrentMatchesControllerTest < ActionController::TestCase
  setup do
    @current_match = current_matches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:current_matches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create current_match" do
    assert_difference('CurrentMatch.count') do
      post :create, current_match: {  }
    end

    assert_redirected_to current_match_path(assigns(:current_match))
  end

  test "should show current_match" do
    get :show, id: @current_match
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @current_match
    assert_response :success
  end

  test "should update current_match" do
    patch :update, id: @current_match, current_match: {  }
    assert_redirected_to current_match_path(assigns(:current_match))
  end

  test "should destroy current_match" do
    assert_difference('CurrentMatch.count', -1) do
      delete :destroy, id: @current_match
    end

    assert_redirected_to current_matches_path
  end
end
