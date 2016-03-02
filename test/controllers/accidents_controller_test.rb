require 'test_helper'

class AccidentsControllerTest < ActionController::TestCase
  setup do
    @accident = accidents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accidents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accident" do
    assert_difference('Accident.count') do
      post :create, accident: { accident_type: @accident.accident_type, commerical_accident_count: @accident.commerical_accident_count, commerical_die_persons: @accident.commerical_die_persons, commerical_economic_losses: @accident.commerical_economic_losses, commerical_note: @accident.commerical_note, commerical_wounded_persons: @accident.commerical_wounded_persons, industry_accident_count: @accident.industry_accident_count, industry_die_persons: @accident.industry_die_persons, industry_economic_losses: @accident.industry_economic_losses, industry_note: @accident.industry_note, industry_wounded_persons: @accident.industry_wounded_persons, mth: @accident.mth, note: @accident.note, org_id: @accident.org_id, user: @accident.user }
    end

    assert_redirected_to accident_path(assigns(:accident))
  end

  test "should show accident" do
    get :show, id: @accident
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @accident
    assert_response :success
  end

  test "should update accident" do
    patch :update, id: @accident, accident: { accident_type: @accident.accident_type, commerical_accident_count: @accident.commerical_accident_count, commerical_die_persons: @accident.commerical_die_persons, commerical_economic_losses: @accident.commerical_economic_losses, commerical_note: @accident.commerical_note, commerical_wounded_persons: @accident.commerical_wounded_persons, industry_accident_count: @accident.industry_accident_count, industry_die_persons: @accident.industry_die_persons, industry_economic_losses: @accident.industry_economic_losses, industry_note: @accident.industry_note, industry_wounded_persons: @accident.industry_wounded_persons, mth: @accident.mth, note: @accident.note, org_id: @accident.org_id, user: @accident.user }
    assert_redirected_to accident_path(assigns(:accident))
  end

  test "should destroy accident" do
    assert_difference('Accident.count', -1) do
      delete :destroy, id: @accident
    end

    assert_redirected_to accidents_path
  end
end
