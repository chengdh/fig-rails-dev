#coding: utf-8
class CheckMeetingsController < MeetingsController
  defaults :resource_class => Meeting, :collection_name => 'meetings', :instance_name => 'meeting'
  #Warning: when overwriting the collection method in a controller
  #the load part of a load_and_authorize_resource call will not work correctly.
  #See https://github.com/ryanb/cancan/issues/274 for the discussions.
  #参照https://github.com/CanCanCommunity/cancancan/wiki/Inherited-Resources解决该问题
  skip_load_and_authorize_resource :only => :index
  #load_and_authorize_resource :training
  table :org,:name,:meeting_date,:meeting_length,:presenter,:check_state_des
  #GET check_meetings/:id/show_check
  #GET check_meetings/:id/show_check.json
  #显示审批界面
  def show_check
    @meeting = Meeting.find(params[:id])
  end

end
