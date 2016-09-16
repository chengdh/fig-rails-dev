#coding: utf-8
#基础类库
class BaseController < InheritedResources::Base
  include InheritedResources::TableBuilder
  load_and_authorize_resource
  helper_method :sort_column,:sort_direction,:resource_name,:resources_name,:show_view_columns
  respond_to :html,:xml,:js,:json,:csv

  def search
    @q =resource_class.ransack(params[:q])
    render partial: "search"
  end

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
    @q= end_of_association_chain.accessible_by(current_ability,:read).ransack(params[:q])
    set_collection_ivar(@q.result.select("DISTINCT #{resource_class.table_name}.*").order(sort_column + ' ' + sort_direction).paginate(:page => params[:page]))
  end

  #inherited resource使用strong paramters
  #参考http://abernardes.github.io/2013/08/21/inherited-resources-with-strong-parameters.html
  def permitted_params
    params.permit!
  end

  def show_or_hide_fields_for_export(html_str)
    doc = Nokogiri::HTML.fragment(html_str,"UTF-8")
    #处理显示问题
    show_fields = params[:show_fields]
    hide_fields = params[:hide_fields]
    doc.css(show_fields).remove_class('hide') if show_fields.present?
    doc.css(hide_fields).remove() if hide_fields.present?
    doc.css(".hide").remove()
    doc.css('table th').attr("style",'border: thin solid #000;')
    doc.css('table td').attr("style",'border: thin solid #000;')
    doc.to_html(encoding: 'UTF-8')
  end

  #处理查询时,传入的机构代码,如果传入的机构有下级机构,则进行处理
  def pre_process_search_params
    return if params[:q].blank?
    new_search_params ={}
    params[:q].each do |key,value|
      if  ['carrying_bills_from_org_id_eq','carrying_bills_to_org_id_eq','carrying_bills_transit_org_id_eq','carrying_bills_to_org_id_or_carrying_bills_transit_org_id_eq','from_org_id_eq','to_org_id_eq','from_org_id_or_to_org_id_eq','transit_org_id_eq','to_org_id_or_transit_org_id_eq'].include?(key) and value.present? and (the_org = Org.includes(:children).find(value)).children.present?
        change_key = key.to_s.gsub(/_eq/,'_in')
        new_search_params[change_key] = [value] + the_org.children.collect(&:id)
        new_search_params[key]= nil
      end
    end
    params[:q].merge!(new_search_params) if new_search_params.present?
    params[:q]
  end

end
