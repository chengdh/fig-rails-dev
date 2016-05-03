require 'test_helper'

class ReceiptVirtualsControllerTest < ActionController::TestCase
  setup do
    @receipt_virtual = receipt_virtuals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receipt_virtuals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create receipt_virtual" do
    assert_difference('ReceiptVirtual.count') do
      post :create, receipt_virtual: {  }
    end

    assert_redirected_to receipt_virtual_path(assigns(:receipt_virtual))
  end

  test "should show receipt_virtual" do
    get :show, id: @receipt_virtual
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @receipt_virtual
    assert_response :success
  end

  test "should update receipt_virtual" do
    patch :update, id: @receipt_virtual, receipt_virtual: {  }
    assert_redirected_to receipt_virtual_path(assigns(:receipt_virtual))
  end

  test "should destroy receipt_virtual" do
    assert_difference('ReceiptVirtual.count', -1) do
      delete :destroy, id: @receipt_virtual
    end

    assert_redirected_to receipt_virtuals_path
  end
end
