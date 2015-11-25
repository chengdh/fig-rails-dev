require 'test_helper'

class ContientsControllerTest < ActionController::TestCase
  setup do
    @contient = contients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contient" do
    assert_difference('Contient.count') do
      post :create, contient: { cn_name: @contient.cn_name, continents_id: @contient.continents_id, en_name: @contient.en_name, sort_value: @contient.sort_value }
    end

    assert_redirected_to contient_path(assigns(:contient))
  end

  test "should show contient" do
    get :show, id: @contient
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contient
    assert_response :success
  end

  test "should update contient" do
    patch :update, id: @contient, contient: { cn_name: @contient.cn_name, continents_id: @contient.continents_id, en_name: @contient.en_name, sort_value: @contient.sort_value }
    assert_redirected_to contient_path(assigns(:contient))
  end

  test "should destroy contient" do
    assert_difference('Contient.count', -1) do
      delete :destroy, id: @contient
    end

    assert_redirected_to contients_path
  end
end
