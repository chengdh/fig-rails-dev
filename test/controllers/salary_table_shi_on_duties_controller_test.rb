require 'test_helper'

class SalaryTableShiOnDutiesControllerTest < ActionController::TestCase
  setup do
    @salary_table_shi_on_duty = salary_table_shi_on_duties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:salary_table_shi_on_duties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create salary_table_shi_on_duty" do
    assert_difference('SalaryTableShiOnDuty.count') do
      post :create, salary_table_shi_on_duty: {  }
    end

    assert_redirected_to salary_table_shi_on_duty_path(assigns(:salary_table_shi_on_duty))
  end

  test "should show salary_table_shi_on_duty" do
    get :show, id: @salary_table_shi_on_duty
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @salary_table_shi_on_duty
    assert_response :success
  end

  test "should update salary_table_shi_on_duty" do
    patch :update, id: @salary_table_shi_on_duty, salary_table_shi_on_duty: {  }
    assert_redirected_to salary_table_shi_on_duty_path(assigns(:salary_table_shi_on_duty))
  end

  test "should destroy salary_table_shi_on_duty" do
    assert_difference('SalaryTableShiOnDuty.count', -1) do
      delete :destroy, id: @salary_table_shi_on_duty
    end

    assert_redirected_to salary_table_shi_on_duties_path
  end
end
