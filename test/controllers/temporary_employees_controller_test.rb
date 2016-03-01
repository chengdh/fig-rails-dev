require 'test_helper'

class TemporaryEmployeesControllerTest < ActionController::TestCase
  setup do
    @temporary_employee = temporary_employees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:temporary_employees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create temporary_employee" do
    assert_difference('TemporaryEmployee.count') do
      post :create, temporary_employee: { begin_date: @temporary_employee.begin_date, belong_to_unit: @temporary_employee.belong_to_unit, gender: @temporary_employee.gender, id_no: @temporary_employee.id_no, is_active: @temporary_employee.is_active, manage_org_id: @temporary_employee.manage_org_id, mobile: @temporary_employee.mobile, name: @temporary_employee.name, note: @temporary_employee.note, org_id: @temporary_employee.org_id, post: @temporary_employee.post }
    end

    assert_redirected_to temporary_employee_path(assigns(:temporary_employee))
  end

  test "should show temporary_employee" do
    get :show, id: @temporary_employee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @temporary_employee
    assert_response :success
  end

  test "should update temporary_employee" do
    patch :update, id: @temporary_employee, temporary_employee: { begin_date: @temporary_employee.begin_date, belong_to_unit: @temporary_employee.belong_to_unit, gender: @temporary_employee.gender, id_no: @temporary_employee.id_no, is_active: @temporary_employee.is_active, manage_org_id: @temporary_employee.manage_org_id, mobile: @temporary_employee.mobile, name: @temporary_employee.name, note: @temporary_employee.note, org_id: @temporary_employee.org_id, post: @temporary_employee.post }
    assert_redirected_to temporary_employee_path(assigns(:temporary_employee))
  end

  test "should destroy temporary_employee" do
    assert_difference('TemporaryEmployee.count', -1) do
      delete :destroy, id: @temporary_employee
    end

    assert_redirected_to temporary_employees_path
  end
end
