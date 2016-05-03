require 'test_helper'

class StockConsumesControllerTest < ActionController::TestCase
  setup do
    @stock_consume = stock_consumes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stock_consumes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stock_consume" do
    assert_difference('StockConsume.count') do
      post :create, stock_consume: {  }
    end

    assert_redirected_to stock_consume_path(assigns(:stock_consume))
  end

  test "should show stock_consume" do
    get :show, id: @stock_consume
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stock_consume
    assert_response :success
  end

  test "should update stock_consume" do
    patch :update, id: @stock_consume, stock_consume: {  }
    assert_redirected_to stock_consume_path(assigns(:stock_consume))
  end

  test "should destroy stock_consume" do
    assert_difference('StockConsume.count', -1) do
      delete :destroy, id: @stock_consume
    end

    assert_redirected_to stock_consumes_path
  end
end
