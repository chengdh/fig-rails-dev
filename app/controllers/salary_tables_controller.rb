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
      render :show
    else
      render :new
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

