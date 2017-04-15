#coding: utf-8
class TemporaryEmployeesController < BaseController
  table :org,:name,:id_no,:duty_org,:post_des,:belong_to_unit,:begin_date,:mobile

  #导出查询结果为excel
  #GET vehicles/export_excel
  def export_excel
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    employees= @q.result
    set_collection_ivar(employees)
    xls = render_to_string(partial: "excel",layout: false)
    xls = show_or_hide_fields_for_export(xls)
    send_data xls,:filename => "相关方人员.xls"
  end

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

