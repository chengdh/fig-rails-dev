#coding: utf-8
class TransformersController < ElectricEquipmentsController
  defaults resource_class: Transformer
  table :org,:qty,:buy_date,:work_type_des,:power,:last_check_date

  private

  def transformer_params
    params.require(:transformer).permit(:org_id,:qty,:buy_date,:work_type_des,:power,:last_check_date)
  end
end

