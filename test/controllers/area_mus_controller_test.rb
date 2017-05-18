require 'test_helper'

class AreaMusControllerTest < ActionController::TestCase
  setup do
    @area_mu = area_mus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:area_mus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create area_mu" do
    assert_difference('AreaMu.count') do
      post :create, area_mu: { area_info_id: @area_mu.area_info_id, mu_percent: @area_mu.mu_percent, mu_result: @area_mu.mu_result, submit_date: @area_mu.submit_date }
    end

    assert_redirected_to area_mu_path(assigns(:area_mu))
  end

  test "should show area_mu" do
    get :show, id: @area_mu
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @area_mu
    assert_response :success
  end

  test "should update area_mu" do
    patch :update, id: @area_mu, area_mu: { area_info_id: @area_mu.area_info_id, mu_percent: @area_mu.mu_percent, mu_result: @area_mu.mu_result, submit_date: @area_mu.submit_date }
    assert_redirected_to area_mu_path(assigns(:area_mu))
  end

  test "should destroy area_mu" do
    assert_difference('AreaMu.count', -1) do
      delete :destroy, id: @area_mu
    end

    assert_redirected_to area_mus_path
  end
end
