#coding: utf-8
#雇员信息
class EmployeesController < BaseController
  table :org,:name,:id_no,:post,:post_level_des,:work_state_des,:mobile
  #GET employees/show_import_xls
  #显示导入窗口
  def show_import_xls
    render  partial: "show_import_xls"
  end

  #POST employees/import_xls
  #导入员工信息
  def import_xls
    org_id = params[:org_id]
    update_if_exist = params[:update_if_exist]
    excel_path = params[:file_excel].path
    begin
      resource_class.import_from_excel(org_id,update_if_exist,excel_path)
      flash[:success] = "导入员工信息成功."
      redirect_to employees_path
    rescue  Exception => e
      flash[:error] = "导入时出现错误,请确认excel文件是否正确.#{e.message}"
      redirect_to :back
    end
  end

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
