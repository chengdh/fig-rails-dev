#coding: utf-8
#出入库单
class InoutBillsController < BaseController
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
  protected
  def collection
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end
  private
  def inout_bill_params
    params.require(:inout_bill).permit(:org_id, :bill_date,:user_id,:f_location_id,:t_location_id,:operator,
                                       :note,:bill_no,:ref_partner,:name,inout_lines_attributes: [:id,:inout_bill_id,:qty,:price,:equipment_id,:_destroy])
  end
end

