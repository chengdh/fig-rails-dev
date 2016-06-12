require 'test_helper'

class SalaryReportXiansControllerTest < ActionController::TestCase
  setup do
    @salary_report_xian = salary_report_xians(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:salary_report_xians)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create salary_report_xian" do
    assert_difference('SalaryReportXian.count') do
      post :create, salary_report_xian: {  }
    end

    assert_redirected_to salary_report_xian_path(assigns(:salary_report_xian))
  end

  test "should show salary_report_xian" do
    get :show, id: @salary_report_xian
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @salary_report_xian
    assert_response :success
  end

  test "should update salary_report_xian" do
    patch :update, id: @salary_report_xian, salary_report_xian: {  }
    assert_redirected_to salary_report_xian_path(assigns(:salary_report_xian))
  end

  test "should destroy salary_report_xian" do
    assert_difference('SalaryReportXian.count', -1) do
      delete :destroy, id: @salary_report_xian
    end

    assert_redirected_to salary_report_xians_path
  end
end
