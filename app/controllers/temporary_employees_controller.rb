#coding: utf-8
class TemporaryEmployeesController < BaseController
  table :org,:name,:gender_des,:id_no,:manage_org,:post,:belong_to_unit,:begin_date,:mobile
  protected
  def collection
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end


  private
  def temporary_employee_params
    params.require(:temporary_employee).permit(:org_id, :name, :gender, :id_no, :manage_org_id, :post, :belong_to_unit, :begin_date, :mobile, :is_active, :note)
  end
end

