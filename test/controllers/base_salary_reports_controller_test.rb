require 'test_helper'

class BaseSalaryReportsControllerTest < ActionController::TestCase
  setup do
    @base_salary_report = base_salary_reports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:base_salary_reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create base_salary_report" do
    assert_difference('BaseSalaryReport.count') do
      post :create, base_salary_report: {  }
    end

    assert_redirected_to base_salary_report_path(assigns(:base_salary_report))
  end

  test "should show base_salary_report" do
    get :show, id: @base_salary_report
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @base_salary_report
    assert_response :success
  end

  test "should update base_salary_report" do
    patch :update, id: @base_salary_report, base_salary_report: {  }
    assert_redirected_to base_salary_report_path(assigns(:base_salary_report))
  end

  test "should destroy base_salary_report" do
    assert_difference('BaseSalaryReport.count', -1) do
      delete :destroy, id: @base_salary_report
    end

    assert_redirected_to base_salary_reports_path
  end
end
