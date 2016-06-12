#coding: utf-8
#领导干部薪酬发放统计台帐
class SalaryReportLeadersController < BaseController
  table :org,:name,:year,:table_date

  protected
  def collection
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end

  private
  def salary_report_leader_params
    params.require(:salary_report_leader).permit!
  end
end
