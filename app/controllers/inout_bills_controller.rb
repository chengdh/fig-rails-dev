#coding: utf-8
#出入库单
class InoutBillsController < BaseController
  private
  def inout_bill_params
    params.require(:inout_bill).permit(:bill_date, :user_id, :f_location_id, :t_location_id, :operater, :state, :note)
  end
end

