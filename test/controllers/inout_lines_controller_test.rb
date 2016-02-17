require 'test_helper'

class InoutLinesControllerTest < ActionController::TestCase
  setup do
    @inout_line = inout_lines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inout_lines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inout_line" do
    assert_difference('InoutLine.count') do
      post :create, inout_line: { amt: @inout_line.amt, f_location_id: @inout_line.f_location_id, inout_bill_id: @inout_line.inout_bill_id, move_date: @inout_line.move_date, price: @inout_line.price, qty: @inout_line.qty, state: @inout_line.state, t_location_id: @inout_line.t_location_id }
    end

    assert_redirected_to inout_line_path(assigns(:inout_line))
  end

  test "should show inout_line" do
    get :show, id: @inout_line
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inout_line
    assert_response :success
  end

  test "should update inout_line" do
    patch :update, id: @inout_line, inout_line: { amt: @inout_line.amt, f_location_id: @inout_line.f_location_id, inout_bill_id: @inout_line.inout_bill_id, move_date: @inout_line.move_date, price: @inout_line.price, qty: @inout_line.qty, state: @inout_line.state, t_location_id: @inout_line.t_location_id }
    assert_redirected_to inout_line_path(assigns(:inout_line))
  end

  test "should destroy inout_line" do
    assert_difference('InoutLine.count', -1) do
      delete :destroy, id: @inout_line
    end

    assert_redirected_to inout_lines_path
  end
end
