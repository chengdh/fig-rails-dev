require 'test_helper'

class LeagueRankingsControllerTest < ActionController::TestCase
  setup do
    @league_ranking = league_rankings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:league_rankings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create league_ranking" do
    assert_difference('LeagueRanking.count') do
      post :create, league_ranking: {  }
    end

    assert_redirected_to league_ranking_path(assigns(:league_ranking))
  end

  test "should show league_ranking" do
    get :show, id: @league_ranking
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @league_ranking
    assert_response :success
  end

  test "should update league_ranking" do
    patch :update, id: @league_ranking, league_ranking: {  }
    assert_redirected_to league_ranking_path(assigns(:league_ranking))
  end

  test "should destroy league_ranking" do
    assert_difference('LeagueRanking.count', -1) do
      delete :destroy, id: @league_ranking
    end

    assert_redirected_to league_rankings_path
  end
end
