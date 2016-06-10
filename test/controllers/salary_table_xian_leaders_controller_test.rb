require 'test_helper'

class SalaryTableXianLeadersControllerTest < ActionController::TestCase
  setup do
    @salary_table_xian_leader = salary_table_xian_leaders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:salary_table_xian_leaders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create salary_table_xian_leader" do
    assert_difference('SalaryTableXianLeader.count') do
      post :create, salary_table_xian_leader: {  }
    end

    assert_redirected_to salary_table_xian_leader_path(assigns(:salary_table_xian_leader))
  end

  test "should show salary_table_xian_leader" do
    get :show, id: @salary_table_xian_leader
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @salary_table_xian_leader
    assert_response :success
  end

  test "should update salary_table_xian_leader" do
    patch :update, id: @salary_table_xian_leader, salary_table_xian_leader: {  }
    assert_redirected_to salary_table_xian_leader_path(assigns(:salary_table_xian_leader))
  end

  test "should destroy salary_table_xian_leader" do
    assert_difference('SalaryTableXianLeader.count', -1) do
      delete :destroy, id: @salary_table_xian_leader
    end

    assert_redirected_to salary_table_xian_leaders_path
  end
end
