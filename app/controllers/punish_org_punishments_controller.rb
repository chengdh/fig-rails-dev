#coding: utf-8
#被处罚机构-信息查看
class PunishOrgPunishmentsController < PunishmentsController
  defaults :resource_class => Punishment, :collection_name => 'punishments', :instance_name => 'punishment'
  #Warning: when overwriting the collection method in a controller
  #the load part of a load_and_authorize_resource call will not work correctly.
  #See https://github.com/ryanb/cancan/issues/274 for the discussions.
  #参照https://github.com/CanCanCommunity/cancancan/wiki/Inherited-Resources解决该问题
  skip_load_and_authorize_resource :only => :index
  #load_and_authorize_resource :training

  table :org,:punish_org,:name,:table_date,:check_state_des
  protected
  def collection
    @q= end_of_association_chain.where(punish_org_id: current_ability_org_ids,check_state: "confirmed").ransack(params[:q])
    set_collection_ivar(@q.result(distinct: true).paginate(:page => params[:page]))
  end
end
