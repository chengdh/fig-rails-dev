#coding: utf-8
class BasePurchaseOrdersController < BaseController
  table :org,:bill_date,:name,:bill_no,:f_location,:t_location
  def create
    po = resource_class.new(base_purchase_order_params)
    set_resource_ivar(po)
    create!
   end

  #PATCH base_purchase_orders/:id/confirm
  #PATCH base_purchase_orders/:id/confirm.json
  def confirm
    po = resource_class.find(params[:id])
    set_resource_ivar(po)
    po.confirm
    if po.update_attributes(confirmer: current_user,confirm_date: Date.today)
      receipt = po.build_receipt(resource_class.get_receipt_class)
      receipt.save!
      flash[:success] = "确认单据成功,已自动生成了入库单[#{receipt.name}]!"
    else
      flash[:err] = "确认单据失败!"
    end
    redirect_to resource
  end
  #导出查询结果为excel
  #GET purchase_dangers/:id/export_excel
  def export_excel
    purchase_order = resource_class.find(params[:id])
    set_resource_ivar(purchase_order)
    xls = render_to_string(partial: "excel",layout: false)
    xls = show_or_hide_fields_for_export(xls)
    send_data xls,:filename => "采购申请单.xls"
  end


  protected
  def collection
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end
  private
  def base_purchase_order_params
    params.require(resource_class.name.underscore.to_sym).permit(:org_id, :bill_date,:user_id,:f_location_id,:t_location_id,:operator,
                                       :note,:bill_no,:name,
                                       po_lines_attributes: [:id,:base_purchase_order_id,:no,:qty,:price,:brand,:model,:note,:equipment_id,:_destroy])
  end
end
