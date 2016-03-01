require 'test_helper'

class SafetyTablesControllerTest < ActionController::TestCase
  setup do
    @safety_table = safety_tables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:safety_tables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create safety_table" do
    assert_difference('SafetyTable.count') do
      post :create, safety_table: { common_edu_percent: @safety_table.common_edu_percent, common_edu_persons: @safety_table.common_edu_persons, danger_count: @safety_table.danger_count, evening_safety_check_count: @safety_table.evening_safety_check_count, fixed_danger_count: @safety_table.fixed_danger_count, fixed_danger_money: @safety_table.fixed_danger_money, invest_equipment_money: @safety_table.invest_equipment_money, invest_faclities_money: @safety_table.invest_faclities_money, mth: @safety_table.mth, no_duplicate_persons: @safety_table.no_duplicate_persons, org_id: @safety_table.org_id, safety_check_count: @safety_table.safety_check_count, safety_edu_money: @safety_table.safety_edu_money, safety_meeting_count: @safety_table.safety_meeting_count, safety_meeting_persons: @safety_table.safety_meeting_persons, safety_meeting_solve_questions: @safety_table.safety_meeting_solve_questions, safety_reward_money: @safety_table.safety_reward_money, special_safety_check_count: @safety_table.special_safety_check_count, special_worker_edu_percent: @safety_table.special_worker_edu_percent, special_worker_edu_persons: @safety_table.special_worker_edu_persons, table_date: @safety_table.table_date, third_edu_percent: @safety_table.third_edu_percent, third_edu_persons: @safety_table.third_edu_persons, user_id: @safety_table.user_id }
    end

    assert_redirected_to safety_table_path(assigns(:safety_table))
  end

  test "should show safety_table" do
    get :show, id: @safety_table
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @safety_table
    assert_response :success
  end

  test "should update safety_table" do
    patch :update, id: @safety_table, safety_table: { common_edu_percent: @safety_table.common_edu_percent, common_edu_persons: @safety_table.common_edu_persons, danger_count: @safety_table.danger_count, evening_safety_check_count: @safety_table.evening_safety_check_count, fixed_danger_count: @safety_table.fixed_danger_count, fixed_danger_money: @safety_table.fixed_danger_money, invest_equipment_money: @safety_table.invest_equipment_money, invest_faclities_money: @safety_table.invest_faclities_money, mth: @safety_table.mth, no_duplicate_persons: @safety_table.no_duplicate_persons, org_id: @safety_table.org_id, safety_check_count: @safety_table.safety_check_count, safety_edu_money: @safety_table.safety_edu_money, safety_meeting_count: @safety_table.safety_meeting_count, safety_meeting_persons: @safety_table.safety_meeting_persons, safety_meeting_solve_questions: @safety_table.safety_meeting_solve_questions, safety_reward_money: @safety_table.safety_reward_money, special_safety_check_count: @safety_table.special_safety_check_count, special_worker_edu_percent: @safety_table.special_worker_edu_percent, special_worker_edu_persons: @safety_table.special_worker_edu_persons, table_date: @safety_table.table_date, third_edu_percent: @safety_table.third_edu_percent, third_edu_persons: @safety_table.third_edu_persons, user_id: @safety_table.user_id }
    assert_redirected_to safety_table_path(assigns(:safety_table))
  end

  test "should destroy safety_table" do
    assert_difference('SafetyTable.count', -1) do
      delete :destroy, id: @safety_table
    end

    assert_redirected_to safety_tables_path
  end
end
