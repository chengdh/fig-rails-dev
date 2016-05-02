require 'test_helper'

class StockItsControllerTest < ActionController::TestCase
  setup do
    @stock_it = stock_its(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stock_its)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stock_it" do
    assert_difference('StockIt.count') do
      post :create, stock_it: {  }
    end

    assert_redirected_to stock_it_path(assigns(:stock_it))
  end

  test "should show stock_it" do
    get :show, id: @stock_it
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stock_it
    assert_response :success
  end

  test "should update stock_it" do
    patch :update, id: @stock_it, stock_it: {  }
    assert_redirected_to stock_it_path(assigns(:stock_it))
  end

  test "should destroy stock_it" do
    assert_difference('StockIt.count', -1) do
      delete :destroy, id: @stock_it
    end

    assert_redirected_to stock_its_path
  end
end
