#coding: utf-8
class AreaInfosController < BaseController
  table :name,:total_area

  #GET area_infos/get_mu_data
  def get_mu_data
    render json: {
      total_area:  AreaInfo.total_area(params),
      finished_mu:  AreaInfo.finished_mus(params),
      last_percent: AreaInfo.last_percent(params)
    }
  end
  private
  def area_info_params
    params.require(:area_info).permit(:code,:city_code,:district_code,:total_area)
  end
end

