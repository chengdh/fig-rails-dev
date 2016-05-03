require 'test_helper'

class ReceiveBillVirtualsControllerTest < ActionController::TestCase
  setup do
    @receive_bill_virtual = receive_bill_virtuals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receive_bill_virtuals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create receive_bill_virtual" do
    assert_difference('ReceiveBillVirtual.count') do
      post :create, receive_bill_virtual: {  }
    end

    assert_redirected_to receive_bill_virtual_path(assigns(:receive_bill_virtual))
  end

  test "should show receive_bill_virtual" do
    get :show, id: @receive_bill_virtual
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @receive_bill_virtual
    assert_response :success
  end

  test "should update receive_bill_virtual" do
    patch :update, id: @receive_bill_virtual, receive_bill_virtual: {  }
    assert_redirected_to receive_bill_virtual_path(assigns(:receive_bill_virtual))
  end

  test "should destroy receive_bill_virtual" do
    assert_difference('ReceiveBillVirtual.count', -1) do
      delete :destroy, id: @receive_bill_virtual
    end

    assert_redirected_to receive_bill_virtuals_path
  end
end
