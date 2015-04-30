require 'test_helper'

class RegisterInfosControllerTest < ActionController::TestCase
  setup do
    @register_info = register_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:register_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create register_info" do
    assert_difference('RegisterInfo.count') do
      post :create, register_info: { company_name: @register_info.company_name }
    end

    assert_redirected_to register_info_path(assigns(:register_info))
  end

  test "should show register_info" do
    get :show, id: @register_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @register_info
    assert_response :success
  end

  test "should update register_info" do
    patch :update, id: @register_info, register_info: { company_name: @register_info.company_name }
    assert_redirected_to register_info_path(assigns(:register_info))
  end

  test "should destroy register_info" do
    assert_difference('RegisterInfo.count', -1) do
      delete :destroy, id: @register_info
    end

    assert_redirected_to register_infos_path
  end
end
