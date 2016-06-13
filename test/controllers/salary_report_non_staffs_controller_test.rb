require 'test_helper'

class SalaryReportNonStaffsControllerTest < ActionController::TestCase
  setup do
    @salary_report_non_staff = salary_report_non_staffs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:salary_report_non_staffs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create salary_report_non_staff" do
    assert_difference('SalaryReportNonStaff.count') do
      post :create, salary_report_non_staff: {  }
    end

    assert_redirected_to salary_report_non_staff_path(assigns(:salary_report_non_staff))
  end

  test "should show salary_report_non_staff" do
    get :show, id: @salary_report_non_staff
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @salary_report_non_staff
    assert_response :success
  end

  test "should update salary_report_non_staff" do
    patch :update, id: @salary_report_non_staff, salary_report_non_staff: {  }
    assert_redirected_to salary_report_non_staff_path(assigns(:salary_report_non_staff))
  end

  test "should destroy salary_report_non_staff" do
    assert_difference('SalaryReportNonStaff.count', -1) do
      delete :destroy, id: @salary_report_non_staff
    end

    assert_redirected_to salary_report_non_staffs_path
  end
end
