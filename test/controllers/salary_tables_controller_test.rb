require 'test_helper'

class SalaryTablesControllerTest < ActionController::TestCase
  setup do
    @salary_table = salary_tables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:salary_tables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create salary_table" do
    assert_difference('SalaryTable.count') do
      post :create, salary_table: { mth: @salary_table.mth, note: @salary_table.note, org_id: @salary_table.org_id, table_date: @salary_table.table_date, user_id: @salary_table.user_id }
    end

    assert_redirected_to salary_table_path(assigns(:salary_table))
  end

  test "should show salary_table" do
    get :show, id: @salary_table
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @salary_table
    assert_response :success
  end

  test "should update salary_table" do
    patch :update, id: @salary_table, salary_table: { mth: @salary_table.mth, note: @salary_table.note, org_id: @salary_table.org_id, table_date: @salary_table.table_date, user_id: @salary_table.user_id }
    assert_redirected_to salary_table_path(assigns(:salary_table))
  end

  test "should destroy salary_table" do
    assert_difference('SalaryTable.count', -1) do
      delete :destroy, id: @salary_table
    end

    assert_redirected_to salary_tables_path
  end
end
