require 'test_helper'

class SalaryTableShiNonStaffsControllerTest < ActionController::TestCase
  setup do
    @salary_table_shi_non_staff = salary_table_shi_non_staffs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:salary_table_shi_non_staffs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create salary_table_shi_non_staff" do
    assert_difference('SalaryTableShiNonStaff.count') do
      post :create, salary_table_shi_non_staff: {  }
    end

    assert_redirected_to salary_table_shi_non_staff_path(assigns(:salary_table_shi_non_staff))
  end

  test "should show salary_table_shi_non_staff" do
    get :show, id: @salary_table_shi_non_staff
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @salary_table_shi_non_staff
    assert_response :success
  end

  test "should update salary_table_shi_non_staff" do
    patch :update, id: @salary_table_shi_non_staff, salary_table_shi_non_staff: {  }
    assert_redirected_to salary_table_shi_non_staff_path(assigns(:salary_table_shi_non_staff))
  end

  test "should destroy salary_table_shi_non_staff" do
    assert_difference('SalaryTableShiNonStaff.count', -1) do
      delete :destroy, id: @salary_table_shi_non_staff
    end

    assert_redirected_to salary_table_shi_non_staffs_path
  end
end
