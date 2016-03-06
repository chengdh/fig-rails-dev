require 'test_helper'

class SalaryItemsControllerTest < ActionController::TestCase
  setup do
    @salary_item = salary_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:salary_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create salary_item" do
    assert_difference('SalaryItem.count') do
      post :create, salary_item: { code: @salary_item.code, is_active: @salary_item.is_active, is_calculate: @salary_item.is_calculate, item_type: @salary_item.item_type, name: @salary_item.name, order_by: @salary_item.order_by, org_id: @salary_item.org_id }
    end

    assert_redirected_to salary_item_path(assigns(:salary_item))
  end

  test "should show salary_item" do
    get :show, id: @salary_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @salary_item
    assert_response :success
  end

  test "should update salary_item" do
    patch :update, id: @salary_item, salary_item: { code: @salary_item.code, is_active: @salary_item.is_active, is_calculate: @salary_item.is_calculate, item_type: @salary_item.item_type, name: @salary_item.name, order_by: @salary_item.order_by, org_id: @salary_item.org_id }
    assert_redirected_to salary_item_path(assigns(:salary_item))
  end

  test "should destroy salary_item" do
    assert_difference('SalaryItem.count', -1) do
      delete :destroy, id: @salary_item
    end

    assert_redirected_to salary_items_path
  end
end
