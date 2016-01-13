require 'test_helper'

class MatchRecommandsControllerTest < ActionController::TestCase
  setup do
    @match_recommand = match_recommands(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:match_recommands)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create match_recommand" do
    assert_difference('MatchRecommand.count') do
      post :create, match_recommand: {  }
    end

    assert_redirected_to match_recommand_path(assigns(:match_recommand))
  end

  test "should show match_recommand" do
    get :show, id: @match_recommand
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @match_recommand
    assert_response :success
  end

  test "should update match_recommand" do
    patch :update, id: @match_recommand, match_recommand: {  }
    assert_redirected_to match_recommand_path(assigns(:match_recommand))
  end

  test "should destroy match_recommand" do
    assert_difference('MatchRecommand.count', -1) do
      delete :destroy, id: @match_recommand
    end

    assert_redirected_to match_recommands_path
  end
end
