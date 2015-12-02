require 'test_helper'

class OddsBallsControllerTest < ActionController::TestCase
  setup do
    @odds_ball = odds_balls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:odds_balls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create odds_ball" do
    assert_difference('OddsBall.count') do
      post :create, odds_ball: {  }
    end

    assert_redirected_to odds_ball_path(assigns(:odds_ball))
  end

  test "should show odds_ball" do
    get :show, id: @odds_ball
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @odds_ball
    assert_response :success
  end

  test "should update odds_ball" do
    patch :update, id: @odds_ball, odds_ball: {  }
    assert_redirected_to odds_ball_path(assigns(:odds_ball))
  end

  test "should destroy odds_ball" do
    assert_difference('OddsBall.count', -1) do
      delete :destroy, id: @odds_ball
    end

    assert_redirected_to odds_balls_path
  end
end
