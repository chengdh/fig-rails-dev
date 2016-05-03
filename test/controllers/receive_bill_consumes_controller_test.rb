require 'test_helper'

class ReceiveBillConsumesControllerTest < ActionController::TestCase
  setup do
    @receive_bill_consume = receive_bill_consumes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receive_bill_consumes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create receive_bill_consume" do
    assert_difference('ReceiveBillConsume.count') do
      post :create, receive_bill_consume: {  }
    end

    assert_redirected_to receive_bill_consume_path(assigns(:receive_bill_consume))
  end

  test "should show receive_bill_consume" do
    get :show, id: @receive_bill_consume
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @receive_bill_consume
    assert_response :success
  end

  test "should update receive_bill_consume" do
    patch :update, id: @receive_bill_consume, receive_bill_consume: {  }
    assert_redirected_to receive_bill_consume_path(assigns(:receive_bill_consume))
  end

  test "should destroy receive_bill_consume" do
    assert_difference('ReceiveBillConsume.count', -1) do
      delete :destroy, id: @receive_bill_consume
    end

    assert_redirected_to receive_bill_consumes_path
  end
end
