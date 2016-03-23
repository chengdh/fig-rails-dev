#coding: utf-8
#应急预案演练
class PlanbDocsController < BaseController
  table :org,:name,:plan_date,:plan_length,:plan_type_des,:check_state_des
  protected
  def collection
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end


  private
  def planb_doc_params
    params.require(:planb_doc).permit(:org_id, :table_date, :user_id, :name, :plan_date, :plan_length, :plan_type, :join_persons, :join_count, :plan_content, :plan_process, :document_name, :audit_date, :audit_persons, :audit_item_1_state, :audit_item_2_state, :audit_item_3_state, :audit_item_3_state, :audit_item_4_state, :audit_item_5_state, :audit_item_6_state, :audit_item_7_state, :audit_item_1_fix, :audit_item_2_fix, :audit_item_3_fix, :audit_item_4_fix, :audit_item_5_fix, :audit_item_6_fix, :audit_item_7_fix, :note, :checker, :checker_id, :check_state, :check_opinion, :check_date)
  end
end

