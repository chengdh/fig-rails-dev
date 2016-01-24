#coding: utf-8
#基础类库
class BaseController < InheritedResources::Base
  authorize_resource :except => :index
  helper_method :sort_column,:sort_direction,:resource_name,:resources_name,:show_view_columns
  respond_to :html,:xml,:js,:json,:csv
  private
  #排序方法
  #见http://asciicasts.com/episodes/228-sortable-table-columns
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"
  end
  def sort_column
    params[:sort].present? ? params[:sort] : "#{resource_class.table_name}.created_at"
  end
  def show_view_columns
    resource_class.columns.collect{|column| column.name.to_sym  }
  end

  def resource_name
    resource_class.model_name.human
  end

  def resources_name
    resource_name.pluralize
  end
  protected
  def collection
    @search = end_of_association_chain.accessible_by(current_ability,:read_with_conditions).ransack(params[:q])
    set_collection_ivar(@search.result.select("DISTINCT #{resource_class.table_name}.*").order(sort_column + ' ' + sort_direction).paginate(:page => params[:page]))
  end
  def show_or_hide_fields_for_export(html_str)
    require 'nokogiri'
    doc = Nokogiri::HTML(html_str)
    #处理显示问题
    show_fields = params[:show_fields]
    hide_fields = params[:hide_fields]
    #如果显示carrying_fee_total,carrying_fee_total_th,k_carrying_fee_total,则显示关联发货短途及到货短途
    #show_relate_fields = ""
    #show_relate_fields +=',.from_short_carrying_fee,.to_short_carrying_fee' if show_fields.try(:include?,'.carrying_fee_total')
    #show_relate_fields +=',.from_short_carrying_fee_th,.to_short_carrying_fee_th' if show_fields.try(:include?,'.carrying_fee_th_total')
    #show_relate_fields +=',.k_from_short_carrying_fee,.k_to_short_carrying_fee' if show_fields.try(:include?,'.k_carrying_fee_total')
    #show_fields += show_relate_fields if show_fields.present?

    doc.css(show_fields).remove_class('hide') if show_fields.present?
    doc.css(hide_fields).remove() if hide_fields.present?
    doc.css(".hide").remove()
    doc.css('th').attr("style","border : thin solid #000;height : 8mm;text-align : center;")
    doc.css('td').attr("style","border : thin solid #000;height : 8mm;")
    doc.to_s
  end

  #处理查询时,传入的机构代码,如果传入的机构有下级机构,则进行处理
  def pre_process_search_params
    return if params[:search].blank?
    new_search_params ={}
    params[:search].each do |key,value|
      if  ['carrying_bills_from_org_id_eq','carrying_bills_to_org_id_eq','carrying_bills_transit_org_id_eq','carrying_bills_to_org_id_or_carrying_bills_transit_org_id_eq','from_org_id_eq','to_org_id_eq','from_org_id_or_to_org_id_eq','transit_org_id_eq','to_org_id_or_transit_org_id_eq'].include?(key) and value.present? and (the_org = Org.includes(:children).find(value)).children.present?
        change_key = key.to_s.gsub(/_eq/,'_in')
        new_search_params[change_key] = [value] + the_org.children.collect(&:id)
        new_search_params[key]= nil
      end
    end
    params[:search].merge!(new_search_params) if new_search_params.present?
    params[:search]
  end
end

