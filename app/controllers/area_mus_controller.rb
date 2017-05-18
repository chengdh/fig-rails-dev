#coding: utf-8
class AreaMusController < BaseController
  table :area_info_name,:submit_date,:mu_result,:mu_percent
  private
  def area_mu_params
    params.require(:area_mu).permit(:area_info_id, :submit_date, :mu_result, :mu_percent)
  end
end

