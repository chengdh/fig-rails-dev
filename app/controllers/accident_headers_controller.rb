#coding: utf-8
#事故月报
class AccidentHeadersController < BaseController
  include ControllerStateMachine
  table :org,:org,:table_date,:check_state_des,:user

  #GET accident_headers/new
  #GET accident_headers/new.json
  def new
    @accident_header = AccidentHeader.find_by(org_id: params[:accident_header].try(:[],:org_id),mth: params[:accident_header].try(:[],:mth))
    if @accident_header.present?
      flash[:warning] = "数据已存在."
      render :show
    else
      @accident_header = AccidentHeader.new(accident_header_params)
      AccidentType.where(is_active: true).each do |t|
        @accident_header.accidents.build(accident_type: t)
      end
    end
  end

  protected
  def collection
    @q= end_of_association_chain.where(org_id: current_ability_org_ids).ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end

  private
  def accident_header_params
    params.require(:accident_header).permit(:org_id, :mth, :table_date, :user_id, :note,
                                            :submitter_ud,:submit_date,:submite_note,
                                            :checker_id,:check_date,:check_state,:check_opinion,
                                            accidents_attributes: [:accident_header_id,
                                                                   :accident_type_id,
                                                                   :industry_accident_count,
                                                                   :industry_die_persons,
                                                                   :industry_wounded_persons,
                                                                   :industry_economic_losses,
                                                                   :industry_note,
                                                                   :commerical_accident_count,
                                                                   :commerical_die_persons,
                                                                   :commerical_wounded_persons,
                                                                   :commerical_economic_losses,
                                                                   :commerical_note,
                                                                   :note]
                                           )
  end
end
