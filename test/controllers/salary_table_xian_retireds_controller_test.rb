require 'test_helper'

class SalaryTableXianRetiredsControllerTest < ActionController::TestCase
  setup do
    @salary_table_xian_retired = salary_table_xian_retireds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:salary_table_xian_retireds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create salary_table_xian_retired" do
    assert_difference('SalaryTableXianRetired.count') do
      post :create, salary_table_xian_retired: {  }
    end

    assert_redirected_to salary_table_xian_retired_path(assigns(:salary_table_xian_retired))
  end

  test "should show salary_table_xian_retired" do
    get :show, id: @salary_table_xian_retired
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @salary_table_xian_retired
    assert_response :success
  end

  test "should update salary_table_xian_retired" do
    patch :update, id: @salary_table_xian_retired, salary_table_xian_retired: {  }
    assert_redirected_to salary_table_xian_retired_path(assigns(:salary_table_xian_retired))
  end

  test "should destroy salary_table_xian_retired" do
    assert_difference('SalaryTableXianRetired.count', -1) do
      delete :destroy, id: @salary_table_xian_retired
    end

    assert_redirected_to salary_table_xian_retireds_path
  end
end
