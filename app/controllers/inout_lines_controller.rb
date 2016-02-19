#coding: utf-8
class InoutLinesController < BaseController
  def new
    set_resource_ivar(resource_class.new)
    3.times {get_resource_ivar.inout_lines.build}
  end

  private

  def inout_line_params
    params.require(:inout_line).permit(:inout_bill_id, :f_location_id, :t_location_id, :move_date, :state, :qty, :price, :amt)
  end
end

