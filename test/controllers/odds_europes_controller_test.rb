require 'test_helper'

class OddsEuropesControllerTest < ActionController::TestCase
  setup do
    @odds_europe = odds_europes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:odds_europes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create odds_europe" do
    assert_difference('OddsEurope.count') do
      post :create, odds_europe: {  }
    end

    assert_redirected_to odds_europe_path(assigns(:odds_europe))
  end

  test "should show odds_europe" do
    get :show, id: @odds_europe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @odds_europe
    assert_response :success
  end

  test "should update odds_europe" do
    patch :update, id: @odds_europe, odds_europe: {  }
    assert_redirected_to odds_europe_path(assigns(:odds_europe))
  end

  test "should destroy odds_europe" do
    assert_difference('OddsEurope.count', -1) do
      delete :destroy, id: @odds_europe
    end

    assert_redirected_to odds_europes_path
  end
end
