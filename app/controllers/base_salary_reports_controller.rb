#coding: utf-8
#工资报表基础类
class BaseSalaryReportsController < BaseController
  table :org,:name,:year,:table_date

  protected
  def collection
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end
end
