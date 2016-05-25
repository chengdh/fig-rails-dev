#coding: utf-8
#出入库单
class InoutBillsController < BaseController
  table :org,:bill_date,:name,:bill_no,:ref_partner,:f_location,:t_location
  def create
    inout_bill = resource_class.new(inout_bill_params)
    inout_bill.inout_lines.each do |l|
      l.f_location = inout_bill.f_location
      l.t_location = inout_bill.t_location
      l.move_date = inout_bill.bill_date
    end
    set_resource_ivar(inout_bill)
    create!
   end
  #导出查询结果为excel
  #GET receive_billss/:id/export_excel
  def export_excel
    recevive_bill = resource_class.find(params[:id])
    set_resource_ivar(recevive_bill)
    xls = render_to_string(partial: "excel",layout: false)
    xls = show_or_hide_fields_for_export(xls)
    send_data xls,:filename => "领用审批单.xls"
  end



  #PATCH inout_bills/:id/confirm
  #PATCH inout_bills/:id/confirm.json
  def confirm
    inout_bill = resource_class.find(params[:id])
    set_resource_ivar(inout_bill)
    inout_bill.confirm
    if inout_bill.update_attributes(confirmer: current_user,confirm_date: Date.today)
      flash[:success] = "确认单据成功!"
    else
      flash[:err] = "确认单据失败!"
    end
    redirect_to resource
  end
  protected
  def collection
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end
  private
  def inout_bill_params
    params.require(resource_class.name.underscore.to_sym).permit(:org_id, :bill_date,:user_id,:f_location_id,:t_location_id,:operator,
                                       :note,:bill_no,:ref_partner,:name,
                                       inout_lines_attributes: [:id,:inout_bill_id,:no,:qty,:price,:brand,:model,:duty_person,:purchase_date,:own_org_id,:note,:equipment_id,:_destroy])
  end
end
