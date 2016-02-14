#coding: utf-8
#雇员信息
class EmployeesController < BaseController
  table :org,:name,:mobile,:qq
  protected
  def collection
    #只能看到本机构的人员信息
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end
  private
  def employee_params
    params.require(:employee).permit(:org_id, :name, :gender, :birthday, :academic, :graduate_from, :id_no, :mobile, :address, :email, :qq, :wechat, :work_day, :post, :note)
  end
end
