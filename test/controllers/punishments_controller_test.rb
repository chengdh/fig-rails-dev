require 'test_helper'

class PunishmentsControllerTest < ActionController::TestCase
  setup do
    @punishment = punishments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:punishments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create punishment" do
    assert_difference('Punishment.count') do
      post :create, punishment: { name: @punishment.name, note: @punishment.note, org_id: @punishment.org_id, post_date: @punishment.post_date, poster_id: @punishment.poster_id, punish_date: @punishment.punish_date, punish_org_id: @punishment.punish_org_id, table_date: @punishment.table_date, user_id: @punishment.user_id }
    end

    assert_redirected_to punishment_path(assigns(:punishment))
  end

  test "should show punishment" do
    get :show, id: @punishment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @punishment
    assert_response :success
  end

  test "should update punishment" do
    patch :update, id: @punishment, punishment: { name: @punishment.name, note: @punishment.note, org_id: @punishment.org_id, post_date: @punishment.post_date, poster_id: @punishment.poster_id, punish_date: @punishment.punish_date, punish_org_id: @punishment.punish_org_id, table_date: @punishment.table_date, user_id: @punishment.user_id }
    assert_redirected_to punishment_path(assigns(:punishment))
  end

  test "should destroy punishment" do
    assert_difference('Punishment.count', -1) do
      delete :destroy, id: @punishment
    end

    assert_redirected_to punishments_path
  end
end
