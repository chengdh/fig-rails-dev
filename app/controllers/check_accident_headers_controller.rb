#coding: utf-8
class CheckAccidentHeadersController < AccidentHeadersController
  defaults :resource_class => AccidentHeader, :collection_name => 'accident_headers', :instance_name => 'accident_header'
  #Warning: when overwriting the collection method in a controller
  #the load part of a load_and_authorize_resource call will not work correctly.
  #See https://github.com/ryanb/cancan/issues/274 for the discussions.
  #参照https://github.com/CanCanCommunity/cancancan/wiki/Inherited-Resources解决该问题
  skip_load_and_authorize_resource :only => [:index,:search]
  #load_and_authorize_resource :training

  #GET check_trainings/:id/show_check
  #GET check_trainings/:id/show_check.json
  #显示审批界面
  def show_check
    @accident_header = AccidentHeader.find(params[:id])
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
