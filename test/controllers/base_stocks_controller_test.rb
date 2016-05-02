require 'test_helper'

class BaseStocksControllerTest < ActionController::TestCase
  setup do
    @base_stock = base_stocks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:base_stocks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create base_stock" do
    assert_difference('BaseStock.count') do
      post :create, base_stock: {  }
    end

    assert_redirected_to base_stock_path(assigns(:base_stock))
  end

  test "should show base_stock" do
    get :show, id: @base_stock
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @base_stock
    assert_response :success
  end

  test "should update base_stock" do
    patch :update, id: @base_stock, base_stock: {  }
    assert_redirected_to base_stock_path(assigns(:base_stock))
  end

  test "should destroy base_stock" do
    assert_difference('BaseStock.count', -1) do
      delete :destroy, id: @base_stock
    end

    assert_redirected_to base_stocks_path
  end
end
