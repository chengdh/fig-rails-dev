require 'test_helper'

class SalaryReportShisControllerTest < ActionController::TestCase
  setup do
    @salary_report_shi = salary_report_shis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:salary_report_shis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create salary_report_shi" do
    assert_difference('SalaryReportShi.count') do
      post :create, salary_report_shi: { 1st_mth_act_pay: @salary_report_shi.1st_mth_act_pay, 1st_mth_persons: @salary_report_shi.1st_mth_persons, 1st_mth_shoud_pay: @salary_report_shi.1st_mth_shoud_pay, 1st_persons_change: @salary_report_shi.1st_persons_change, org_id: @salary_report_shi.org_id, post_level: @salary_report_shi.post_level, table_date: @salary_report_shi.table_date, user_id: @salary_report_shi.user_id, work_state: @salary_report_shi.work_state, year: @salary_report_shi.year }
    end

    assert_redirected_to salary_report_shi_path(assigns(:salary_report_shi))
  end

  test "should show salary_report_shi" do
    get :show, id: @salary_report_shi
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @salary_report_shi
    assert_response :success
  end

  test "should update salary_report_shi" do
    patch :update, id: @salary_report_shi, salary_report_shi: { 1st_mth_act_pay: @salary_report_shi.1st_mth_act_pay, 1st_mth_persons: @salary_report_shi.1st_mth_persons, 1st_mth_shoud_pay: @salary_report_shi.1st_mth_shoud_pay, 1st_persons_change: @salary_report_shi.1st_persons_change, org_id: @salary_report_shi.org_id, post_level: @salary_report_shi.post_level, table_date: @salary_report_shi.table_date, user_id: @salary_report_shi.user_id, work_state: @salary_report_shi.work_state, year: @salary_report_shi.year }
    assert_redirected_to salary_report_shi_path(assigns(:salary_report_shi))
  end

  test "should destroy salary_report_shi" do
    assert_difference('SalaryReportShi.count', -1) do
      delete :destroy, id: @salary_report_shi
    end

    assert_redirected_to salary_report_shis_path
  end
end
