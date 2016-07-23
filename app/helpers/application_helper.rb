#coding: utf-8
module ApplicationHelper
  #排序辅助方法
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == sort_column) ? "current_sort_column #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "desc") ? "asc" : "desc"
    link_to title, params.merge(:sort => column, :direction => direction,:page => nil), {:class => css_class,:title => "点击可排序"}
  end
  #根据索引生成页面上的序号
  def order_no(index,cur_page = 1,rows_per_page = 30)
    cur_page = 1 if cur_page.blank?
    rows_per_page = 30 if rows_per_page.blank?
    cur_page = cur_page.to_i if cur_page.kind_of?(String)
    rows_per_page = cur_page.to_i if rows_per_page.kind_of?(String)
    index+1 + rows_per_page*(cur_page - 1)
  end
  #将foreign_key 生成association
  def foreign_key_to_association(column)
    ret = column.to_s.gsub!(/_id/,"")
    ret = column if ret.blank?
    ret.to_sym
  end
  #生成前后12个月的select
  def months_for_select
    ret = []
    (1..36).each do |step|
      mth = step.months.ago
      ret << [mth.strftime('%Y年%m月'),mth.strftime('%Y%m')]
    end
    ret
  end
  #生成前3年的select
  def years_for_select
    ret = []
    (0..3).each do |step|
      year = step.years.ago
      ret << [year.strftime('%Y年'),year.strftime('%Y')]
    end
    ret
  end



  #search form for formtastic
  def semantic_search_form_for(*args, &block)
    opts = args.extract_options!
    opts[:builder] = FormtasticBootstrap::FormBuilder

    # add the default form class
    # (works whether existing class is a String like
    # "foo bar" or an Array like ["foo", "bar"])
    opts[:html] ||= {}
    opts[:html][:class] ||= []
    opts[:html][:class] << ' ' if opts[:html][:class].is_a? String
    opts[:html][:class] << Formtastic::Helpers::FormHelper.default_form_class

    search_form_for(*args, opts, &block)
  end

end
