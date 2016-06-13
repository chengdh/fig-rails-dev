require 'test_helper'

class SalaryReportOnDutyEmployeesControllerTest < ActionController::TestCase
  setup do
    @salary_report_on_duty_employee = salary_report_on_duty_employees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:salary_report_on_duty_employees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create salary_report_on_duty_employee" do
    assert_difference('SalaryReportOnDutyEmployee.count') do
      post :create, salary_report_on_duty_employee: {  }
    end

    assert_redirected_to salary_report_on_duty_employee_path(assigns(:salary_report_on_duty_employee))
  end

  test "should show salary_report_on_duty_employee" do
    get :show, id: @salary_report_on_duty_employee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @salary_report_on_duty_employee
    assert_response :success
  end

  test "should update salary_report_on_duty_employee" do
    patch :update, id: @salary_report_on_duty_employee, salary_report_on_duty_employee: {  }
    assert_redirected_to salary_report_on_duty_employee_path(assigns(:salary_report_on_duty_employee))
  end

  test "should destroy salary_report_on_duty_employee" do
    assert_difference('SalaryReportOnDutyEmployee.count', -1) do
      delete :destroy, id: @salary_report_on_duty_employee
    end

    assert_redirected_to salary_report_on_duty_employees_path
  end
end
