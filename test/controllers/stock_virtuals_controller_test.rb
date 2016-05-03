require 'test_helper'

class StockVirtualsControllerTest < ActionController::TestCase
  setup do
    @stock_virtual = stock_virtuals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stock_virtuals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stock_virtual" do
    assert_difference('StockVirtual.count') do
      post :create, stock_virtual: {  }
    end

    assert_redirected_to stock_virtual_path(assigns(:stock_virtual))
  end

  test "should show stock_virtual" do
    get :show, id: @stock_virtual
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stock_virtual
    assert_response :success
  end

  test "should update stock_virtual" do
    patch :update, id: @stock_virtual, stock_virtual: {  }
    assert_redirected_to stock_virtual_path(assigns(:stock_virtual))
  end

  test "should destroy stock_virtual" do
    assert_difference('StockVirtual.count', -1) do
      delete :destroy, id: @stock_virtual
    end

    assert_redirected_to stock_virtuals_path
  end
end
