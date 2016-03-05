require 'test_helper'

class MeetingsControllerTest < ActionController::TestCase
  setup do
    @meeting = meetings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:meetings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create meeting" do
    assert_difference('Meeting.count') do
      post :create, meeting: { check_date: @meeting.check_date, check_opinion: @meeting.check_opinion, check_state: @meeting.check_state, checker_id: @meeting.checker_id, join_persions: @meeting.join_persions, joint_count: @meeting.joint_count, meeting_content: @meeting.meeting_content, meeting_date: @meeting.meeting_date, meeting_length: @meeting.meeting_length, name: @meeting.name, note: @meeting.note, org_id: @meeting.org_id, presenter: @meeting.presenter, table_date: @meeting.table_date, user_id: @meeting.user_id }
    end

    assert_redirected_to meeting_path(assigns(:meeting))
  end

  test "should show meeting" do
    get :show, id: @meeting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @meeting
    assert_response :success
  end

  test "should update meeting" do
    patch :update, id: @meeting, meeting: { check_date: @meeting.check_date, check_opinion: @meeting.check_opinion, check_state: @meeting.check_state, checker_id: @meeting.checker_id, join_persions: @meeting.join_persions, joint_count: @meeting.joint_count, meeting_content: @meeting.meeting_content, meeting_date: @meeting.meeting_date, meeting_length: @meeting.meeting_length, name: @meeting.name, note: @meeting.note, org_id: @meeting.org_id, presenter: @meeting.presenter, table_date: @meeting.table_date, user_id: @meeting.user_id }
    assert_redirected_to meeting_path(assigns(:meeting))
  end

  test "should destroy meeting" do
    assert_difference('Meeting.count', -1) do
      delete :destroy, id: @meeting
    end

    assert_redirected_to meetings_path
  end
end
