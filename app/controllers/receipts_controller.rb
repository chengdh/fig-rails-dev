#coding: utf-8
#采购入库单
class ReceiptsController < InoutBillsController
  table :org,:bill_date,:f_location,:t_location,:operator,:state
  defaults resource_class: Receipt, collection_name: 'receipts', instance_name: 'receipt'

  private

  def receipt_params
    params.require(:inout_bill).permit(:bill_date, :user_id, :f_location_id, :t_location_id, :operater, :state, :note)
  end
end

