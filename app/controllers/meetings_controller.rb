#coding: utf-8
#会议记录
class MeetingsController < BaseController
  include ControllerStateMachine
  table :org,:name,:meeting_date,:meeting_length,:presenter,:check_state_des
  protected
  def collection
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end

  private
  def meeting_params
    params.require(:meeting).permit(:org_id, :user_id, :table_date, :name, :meeting_date, :meeting_length, :presenter, :join_persons, :join_count, :meeting_content, :check_state, :check_opinion, :checker_id, :check_date, :note)
  end
end

