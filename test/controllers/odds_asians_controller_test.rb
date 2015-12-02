require 'test_helper'

class OddsAsiansControllerTest < ActionController::TestCase
  setup do
    @odds_asian = odds_asians(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:odds_asians)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create odds_asian" do
    assert_difference('OddsAsian.count') do
      post :create, odds_asian: {  }
    end

    assert_redirected_to odds_asian_path(assigns(:odds_asian))
  end

  test "should show odds_asian" do
    get :show, id: @odds_asian
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @odds_asian
    assert_response :success
  end

  test "should update odds_asian" do
    patch :update, id: @odds_asian, odds_asian: {  }
    assert_redirected_to odds_asian_path(assigns(:odds_asian))
  end

  test "should destroy odds_asian" do
    assert_difference('OddsAsian.count', -1) do
      delete :destroy, id: @odds_asian
    end

    assert_redirected_to odds_asians_path
  end
end
