require 'test_helper'

class WebAppsControllerTest < ActionController::TestCase
  setup do
    @web_app = web_apps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:web_apps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create web_app" do
    assert_difference('WebApp.count') do
      post :create, web_app: { el_password: @web_app.el_password, el_username: @web_app.el_username, is_active: @web_app.is_active, name: @web_app.name }
    end

    assert_redirected_to web_app_path(assigns(:web_app))
  end

  test "should show web_app" do
    get :show, id: @web_app
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @web_app
    assert_response :success
  end

  test "should update web_app" do
    patch :update, id: @web_app, web_app: { el_password: @web_app.el_password, el_username: @web_app.el_username, is_active: @web_app.is_active, name: @web_app.name }
    assert_redirected_to web_app_path(assigns(:web_app))
  end

  test "should destroy web_app" do
    assert_difference('WebApp.count', -1) do
      delete :destroy, id: @web_app
    end

    assert_redirected_to web_apps_path
  end
end
