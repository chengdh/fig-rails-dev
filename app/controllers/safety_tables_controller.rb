#coding: utf-8
class SafetyTablesController < BaseController
  include ControllerStateMachine

  def new
    #判断是否在录入时间段内当月26至次月3日前
    if SafetyTable.in_upload_period?
      mth = SafetyTable.default_mth
      @salary_table = SafetyTable.find_by(mth: mth,org_id: current_user.current_org.id)

      if @salary_table.present?
        render :show
      else
        @salary_table = SafetyTable.new(mth: mth,org_id: current_user.current_org.id)
      end
    else
      flash[:warning] = "数据上报时段为当月26号至下月3号前,当前时间不在数据上报时间内!"
      redirect_to :back
    end
  end

  protected
  def collection
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end

  private
  def safety_table_params
    params.require(:safety_table).permit(:org_id, :mth, :safety_check_count, :special_safety_check_count, :evening_safety_check_count,
                                         :danger_count, :fixed_danger_count, :third_edu_persons, :third_edu_percent,
                                         :special_worker_edu_persons, :special_worker_edu_percent, :common_edu_persons,
                                         :no_duplicate_persons, :common_edu_percent, :invest_equipment_money, :invest_faclities_money,
                                         :fixed_danger_money, :safety_edu_money, :safety_reward_money, :safety_meeting_count,
                                         :submitter_id,:submit_date,:submit_note,:check_state,:checker_id,:check_opinion,:check_date,
                                         :safety_meeting_persons, :safety_meeting_solve_questions, :table_date, :user_id)
  end
end
