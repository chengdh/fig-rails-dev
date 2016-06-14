#coding: utf-8
#安全月报检查
class CheckSafetyTablesController < SafetyTablesController
  defaults :resource_class => SafetyTable, :collection_name => 'safety_tables', :instance_name => 'safety_table'
  #Warning: when overwriting the collection method in a controller
  #the load part of a load_and_authorize_resource call will not work correctly.
  #See https://github.com/ryanb/cancan/issues/274 for the discussions.
  #参照https://github.com/CanCanCommunity/cancancan/wiki/Inherited-Resources解决该问题
  skip_load_and_authorize_resource :only => [:index,:search]
  #load_and_authorize_resource :training
  table :org,:name,:meeting_date,:meeting_length,:presenter,:check_state_des
  #GET check_meetings/:id/show_check
  #GET check_meetings/:id/show_check.json
  #显示审批界面
  def show_check
    @safety_table = SafetyTable.find(params[:id])
  end
  private
  def safety_table_params
    params.require(:safety_table).permit(:org_id, :mth, :safety_check_count, :special_safety_check_count, :evening_safety_check_count,
                                         :danger_count, :fixed_danger_count, :third_edu_persons, :third_edu_percent,
                                         :special_worker_edu_persons, :special_worker_edu_percent, :common_edu_persons,
                                         :no_duplicate_persons, :common_edu_percent, :invest_equipment_money, :invest_faclities_money,
                                         :fixed_danger_money, :safety_edu_money, :safety_reward_money, :safety_meeting_count,
                                         :submitter_id,:submit_date,:submit_note,:checker_id,:check_state,:check_opinion,:check_date,
                                         :safety_meeting_persons, :safety_meeting_solve_questions, :table_date, :user_id)
  end
end
