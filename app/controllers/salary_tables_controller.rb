#coding: utf-8
class SalaryTablesController < BaseController
  table :org,:name,:mth
  #默认显示上月数据
  def new
    org_id = current_user.current_org.id
    mth = 1.month.ago.strftime("%Y%m")
    @salary_table = SalaryTable.new_with_params(org_id,mth)
    if not @salary_table.new_record?
      flash[:info] = "工资表已存在!"
      redirect_to @salary_table
    else
      render :new
    end
  end

  #GET salary_tables/show_import_xls
  #显示导入窗口
  def show_import_xls
    render partial: "show_import_xls"
  end

  #POST salary_tables/import_xls
  #导入工资表模板
  def import_xls
    org_id = params[:org_id]
    mth = params[:mth]
    @salary_table = SalaryTable.new_with_params(org_id,mth)
    if not @salary_table.new_record?
      flash[:info] = "工资表已存在!"
      redirect_to @salary_table
    else
      excel_path = params[:file_excel].path
      begin
        @salary_table = SalaryTable.create_with_excel(org_id,mth,excel_path,current_user.id)
        redirect_to @salary_table
      rescue
        flash[:error] = "导入时出现错误,请确认excel文件是否正确."
        redirect_to :back
      end
    end
  end


  protected
  def collection
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end


  private
  def salary_table_params
    params.require(:salary_table).permit(:org_id, :mth, :table_date, :note, :user_id,salary_table_lines_attributes: [:id,:employee_id])
  end
end
