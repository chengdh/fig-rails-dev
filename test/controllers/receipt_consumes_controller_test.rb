require 'test_helper'

class ReceiptConsumesControllerTest < ActionController::TestCase
  setup do
    @receipt_consume = receipt_consumes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receipt_consumes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create receipt_consume" do
    assert_difference('ReceiptConsume.count') do
      post :create, receipt_consume: {  }
    end

    assert_redirected_to receipt_consume_path(assigns(:receipt_consume))
  end

  test "should show receipt_consume" do
    get :show, id: @receipt_consume
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @receipt_consume
    assert_response :success
  end

  test "should update receipt_consume" do
    patch :update, id: @receipt_consume, receipt_consume: {  }
    assert_redirected_to receipt_consume_path(assigns(:receipt_consume))
  end

  test "should destroy receipt_consume" do
    assert_difference('ReceiptConsume.count', -1) do
      delete :destroy, id: @receipt_consume
    end

    assert_redirected_to receipt_consumes_path
  end
end
