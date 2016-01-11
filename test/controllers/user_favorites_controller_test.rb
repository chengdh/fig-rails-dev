require 'test_helper'

class UserFavoritesControllerTest < ActionController::TestCase
  setup do
    @user_favorite = user_favorites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_favorites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_favorite" do
    assert_difference('UserFavorite.count') do
      post :create, user_favorite: {  }
    end

    assert_redirected_to user_favorite_path(assigns(:user_favorite))
  end

  test "should show user_favorite" do
    get :show, id: @user_favorite
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_favorite
    assert_response :success
  end

  test "should update user_favorite" do
    patch :update, id: @user_favorite, user_favorite: {  }
    assert_redirected_to user_favorite_path(assigns(:user_favorite))
  end

  test "should destroy user_favorite" do
    assert_difference('UserFavorite.count', -1) do
      delete :destroy, id: @user_favorite
    end

    assert_redirected_to user_favorites_path
  end
end
