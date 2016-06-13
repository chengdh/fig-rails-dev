require 'test_helper'

class SalaryReportRetiredsControllerTest < ActionController::TestCase
  setup do
    @salary_report_retired = salary_report_retireds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:salary_report_retireds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create salary_report_retired" do
    assert_difference('SalaryReportRetired.count') do
      post :create, salary_report_retired: {  }
    end

    assert_redirected_to salary_report_retired_path(assigns(:salary_report_retired))
  end

  test "should show salary_report_retired" do
    get :show, id: @salary_report_retired
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @salary_report_retired
    assert_response :success
  end

  test "should update salary_report_retired" do
    patch :update, id: @salary_report_retired, salary_report_retired: {  }
    assert_redirected_to salary_report_retired_path(assigns(:salary_report_retired))
  end

  test "should destroy salary_report_retired" do
    assert_difference('SalaryReportRetired.count', -1) do
      delete :destroy, id: @salary_report_retired
    end

    assert_redirected_to salary_report_retireds_path
  end
end
