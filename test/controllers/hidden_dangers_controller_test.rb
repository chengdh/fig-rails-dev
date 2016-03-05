require 'test_helper'

class HiddenDangersControllerTest < ActionController::TestCase
  setup do
    @hidden_danger = hidden_dangers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hidden_dangers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hidden_danger" do
    assert_difference('HiddenDanger.count') do
      post :create, hidden_danger: { danger_date: @hidden_danger.danger_date, danger_org_id: @hidden_danger.danger_org_id, fix_period: @hidden_danger.fix_period, fixed_date: @hidden_danger.fixed_date, fixed_state: @hidden_danger.fixed_state, fixer_id: @hidden_danger.fixer_id, name: @hidden_danger.name, note: @hidden_danger.note, org_id: @hidden_danger.org_id, parent_id: @hidden_danger.parent_id, review_date: @hidden_danger.review_date, review_state: @hidden_danger.review_state, reviewer_id: @hidden_danger.reviewer_id }
    end

    assert_redirected_to hidden_danger_path(assigns(:hidden_danger))
  end

  test "should show hidden_danger" do
    get :show, id: @hidden_danger
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hidden_danger
    assert_response :success
  end

  test "should update hidden_danger" do
    patch :update, id: @hidden_danger, hidden_danger: { danger_date: @hidden_danger.danger_date, danger_org_id: @hidden_danger.danger_org_id, fix_period: @hidden_danger.fix_period, fixed_date: @hidden_danger.fixed_date, fixed_state: @hidden_danger.fixed_state, fixer_id: @hidden_danger.fixer_id, name: @hidden_danger.name, note: @hidden_danger.note, org_id: @hidden_danger.org_id, parent_id: @hidden_danger.parent_id, review_date: @hidden_danger.review_date, review_state: @hidden_danger.review_state, reviewer_id: @hidden_danger.reviewer_id }
    assert_redirected_to hidden_danger_path(assigns(:hidden_danger))
  end

  test "should destroy hidden_danger" do
    assert_difference('HiddenDanger.count', -1) do
      delete :destroy, id: @hidden_danger
    end

    assert_redirected_to hidden_dangers_path
  end
end
