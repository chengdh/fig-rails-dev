#coding: utf-8
class DistributeBoxesController < ElectricEquipmentsController 
  defaults resource_class: DistributeBox
  table :org,:qty,:buy_date,:volume,:last_check_date

  private

  def distribute_box_params
    params.require(:distribute_box).permit(:org_id,:qty,:buy_date,:volume,:last_check_date)
  end
end

