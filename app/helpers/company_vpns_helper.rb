#coding: utf-8
module CompanyVpnsHelper
  def powers_for_select
    array = %w{12313网站 NC财务预算 卷烟信息平台 卷烟临时信息平台 卷烟经营决策管理系统 卷烟网上订货
    审计信息化系统 河南烟草专卖管理信息系统 烟叶信息查询子系统 省公司网站 综合档案管理系统
    南阳文字爱好者网站}
    ret = array.each_with_index.map {|a,i| [a,i]}
    ret
  end
end
