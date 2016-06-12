require 'test_helper'

class SalaryReportLeadersControllerTest < ActionController::TestCase
  setup do
    @salary_report_leader = salary_report_leaders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:salary_report_leaders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create salary_report_leader" do
    assert_difference('SalaryReportLeader.count') do
      post :create, salary_report_leader: {  }
    end

    assert_redirected_to salary_report_leader_path(assigns(:salary_report_leader))
  end

  test "should show salary_report_leader" do
    get :show, id: @salary_report_leader
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @salary_report_leader
    assert_response :success
  end

  test "should update salary_report_leader" do
    patch :update, id: @salary_report_leader, salary_report_leader: {  }
    assert_redirected_to salary_report_leader_path(assigns(:salary_report_leader))
  end

  test "should destroy salary_report_leader" do
    assert_difference('SalaryReportLeader.count', -1) do
      delete :destroy, id: @salary_report_leader
    end

    assert_redirected_to salary_report_leaders_path
  end
end
