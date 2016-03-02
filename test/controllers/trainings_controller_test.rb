require 'test_helper'

class TrainingsControllerTest < ActionController::TestCase
  setup do
    @training = trainings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trainings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create training" do
    assert_difference('Training.count') do
      post :create, training: { assess_type: @training.assess_type, check_opinion: @training.check_opinion, check_state: @training.check_state, checker_id: @training.checker_id, is_assess: @training.is_assess, join_count: @training.join_count, join_persons: @training.join_persons, name: @training.name, org_id: @training.org_id, qualified_rate: @training.qualified_rate, table_date: @training.table_date, teachers: @training.teachers, training_content: @training.training_content, training_date: @training.training_date, training_length: @training.training_length, user_id: @training.user_id }
    end

    assert_redirected_to training_path(assigns(:training))
  end

  test "should show training" do
    get :show, id: @training
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @training
    assert_response :success
  end

  test "should update training" do
    patch :update, id: @training, training: { assess_type: @training.assess_type, check_opinion: @training.check_opinion, check_state: @training.check_state, checker_id: @training.checker_id, is_assess: @training.is_assess, join_count: @training.join_count, join_persons: @training.join_persons, name: @training.name, org_id: @training.org_id, qualified_rate: @training.qualified_rate, table_date: @training.table_date, teachers: @training.teachers, training_content: @training.training_content, training_date: @training.training_date, training_length: @training.training_length, user_id: @training.user_id }
    assert_redirected_to training_path(assigns(:training))
  end

  test "should destroy training" do
    assert_difference('Training.count', -1) do
      delete :destroy, id: @training
    end

    assert_redirected_to trainings_path
  end
end
