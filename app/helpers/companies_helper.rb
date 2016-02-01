#coding: utf-8
module CompaniesHelper
  def companies_for_select
    Company.all.map {|c| [c.cn_name,c.id]}
  end
end
