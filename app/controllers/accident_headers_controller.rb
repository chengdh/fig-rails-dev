#coding: utf-8
#事故月报
class AccidentHeadersController < BaseController
  include ControllerStateMachine
  table :org,:org,:table_date,:check_state_des,:user

  #GET accident_headers/new
  #GET accident_headers/new.json
  def new
    #判断是否在录入时间段内当月26至次月3日前
    if AccidentHeader.in_upload_period?
      mth = AccidentHeader.default_mth
      @accident_header = AccidentHeader.find_by(mth: mth,org_id: current_user.current_org.id)

      if @accident_header.present?
        render :show
      else
        @accident_header= AccidentHeader.new(mth: mth,org_id: current_user.current_org.id)
        AccidentType.where(is_active: true).each do |t|
          @accident_header.accidents.build(accident_type: t)
        end
      end
    else
      flash[:warning] = "数据上报时段为当月26号至下月3号前,当前时间不在数据上报时间内!"
      redirect_to :back
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
