require 'test_helper'

class SalaryItemHeadersControllerTest < ActionController::TestCase
  setup do
    @salary_item_header = salary_item_headers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:salary_item_headers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create salary_item_header" do
    assert_difference('SalaryItemHeader.count') do
      post :create, salary_item_header: { is_active: @salary_item_header.is_active, note: @salary_item_header.note, order_by: @salary_item_header.order_by, org_id: @salary_item_header.org_id }
    end

    assert_redirected_to salary_item_header_path(assigns(:salary_item_header))
  end

  test "should show salary_item_header" do
    get :show, id: @salary_item_header
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @salary_item_header
    assert_response :success
  end

  test "should update salary_item_header" do
    patch :update, id: @salary_item_header, salary_item_header: { is_active: @salary_item_header.is_active, note: @salary_item_header.note, order_by: @salary_item_header.order_by, org_id: @salary_item_header.org_id }
    assert_redirected_to salary_item_header_path(assigns(:salary_item_header))
  end

  test "should destroy salary_item_header" do
    assert_difference('SalaryItemHeader.count', -1) do
      delete :destroy, id: @salary_item_header
    end

    assert_redirected_to salary_item_headers_path
  end
end
