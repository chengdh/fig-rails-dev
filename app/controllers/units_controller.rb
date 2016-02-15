#coding: utf-8
class UnitsController < BaseController
  table :name,:order_by,:is_active
  private
  def unit_params
    params.require(:unit).permit(:name, :order_by, :is_active)
  end
end
