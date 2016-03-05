#coding: utf-8
#事故月报
class AccidentHeadersController < BaseController

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
    vals = {}
    begin
      vals = params.try(:require,:accident_header).try(:permit,:org_id, :mth, :table_date, :user_id, :note)
    rescue
    end
    vals
  end
end
