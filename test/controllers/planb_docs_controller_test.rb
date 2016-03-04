require 'test_helper'

class PlanbDocsControllerTest < ActionController::TestCase
  setup do
    @planb_doc = planb_docs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:planb_docs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create planb_doc" do
    assert_difference('PlanbDoc.count') do
      post :create, planb_doc: { audit_date: @planb_doc.audit_date, audit_item_1_fix: @planb_doc.audit_item_1_fix, audit_item_1_state: @planb_doc.audit_item_1_state, audit_item_2_fix: @planb_doc.audit_item_2_fix, audit_item_2_state: @planb_doc.audit_item_2_state, audit_item_3_fix: @planb_doc.audit_item_3_fix, audit_item_3_state: @planb_doc.audit_item_3_state, audit_item_3_state: @planb_doc.audit_item_3_state, audit_item_4_fix: @planb_doc.audit_item_4_fix, audit_item_4_state: @planb_doc.audit_item_4_state, audit_item_5_fix: @planb_doc.audit_item_5_fix, audit_item_5_state: @planb_doc.audit_item_5_state, audit_item_6_fix: @planb_doc.audit_item_6_fix, audit_item_6_state: @planb_doc.audit_item_6_state, audit_item_7_fix: @planb_doc.audit_item_7_fix, audit_item_7_state: @planb_doc.audit_item_7_state, audit_persons: @planb_doc.audit_persons, check_date: @planb_doc.check_date, check_opinion: @planb_doc.check_opinion, check_state: @planb_doc.check_state, checker: @planb_doc.checker, checker_id: @planb_doc.checker_id, document_name: @planb_doc.document_name, join_count: @planb_doc.join_count, join_persons: @planb_doc.join_persons, name: @planb_doc.name, note: @planb_doc.note, org_id: @planb_doc.org_id, plan_content: @planb_doc.plan_content, plan_date: @planb_doc.plan_date, plan_length: @planb_doc.plan_length, plan_process: @planb_doc.plan_process, plan_type: @planb_doc.plan_type, table_date: @planb_doc.table_date, user_id: @planb_doc.user_id }
    end

    assert_redirected_to planb_doc_path(assigns(:planb_doc))
  end

  test "should show planb_doc" do
    get :show, id: @planb_doc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @planb_doc
    assert_response :success
  end

  test "should update planb_doc" do
    patch :update, id: @planb_doc, planb_doc: { audit_date: @planb_doc.audit_date, audit_item_1_fix: @planb_doc.audit_item_1_fix, audit_item_1_state: @planb_doc.audit_item_1_state, audit_item_2_fix: @planb_doc.audit_item_2_fix, audit_item_2_state: @planb_doc.audit_item_2_state, audit_item_3_fix: @planb_doc.audit_item_3_fix, audit_item_3_state: @planb_doc.audit_item_3_state, audit_item_3_state: @planb_doc.audit_item_3_state, audit_item_4_fix: @planb_doc.audit_item_4_fix, audit_item_4_state: @planb_doc.audit_item_4_state, audit_item_5_fix: @planb_doc.audit_item_5_fix, audit_item_5_state: @planb_doc.audit_item_5_state, audit_item_6_fix: @planb_doc.audit_item_6_fix, audit_item_6_state: @planb_doc.audit_item_6_state, audit_item_7_fix: @planb_doc.audit_item_7_fix, audit_item_7_state: @planb_doc.audit_item_7_state, audit_persons: @planb_doc.audit_persons, check_date: @planb_doc.check_date, check_opinion: @planb_doc.check_opinion, check_state: @planb_doc.check_state, checker: @planb_doc.checker, checker_id: @planb_doc.checker_id, document_name: @planb_doc.document_name, join_count: @planb_doc.join_count, join_persons: @planb_doc.join_persons, name: @planb_doc.name, note: @planb_doc.note, org_id: @planb_doc.org_id, plan_content: @planb_doc.plan_content, plan_date: @planb_doc.plan_date, plan_length: @planb_doc.plan_length, plan_process: @planb_doc.plan_process, plan_type: @planb_doc.plan_type, table_date: @planb_doc.table_date, user_id: @planb_doc.user_id }
    assert_redirected_to planb_doc_path(assigns(:planb_doc))
  end

  test "should destroy planb_doc" do
    assert_difference('PlanbDoc.count', -1) do
      delete :destroy, id: @planb_doc
    end

    assert_redirected_to planb_docs_path
  end
end
