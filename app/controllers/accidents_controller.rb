#coding: utf-8
class AccidentsController < BaseController
  private
  def accident_params
    params.require(:accident).permit(:org_id, :mth, :user, :accident_type, :industry_accident_count, :industry_die_persons, :industry_wounded_persons, :industry_economic_losses, :industry_note, :commerical_accident_count, :commerical_die_persons, :commerical_wounded_persons, :commerical_economic_losses, :commerical_note, :note)
  end
end

