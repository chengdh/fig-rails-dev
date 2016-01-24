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

end
