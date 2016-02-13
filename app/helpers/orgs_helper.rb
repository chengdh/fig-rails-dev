#coding: utf-8
module OrgsHelper
  #机构选择
  def orgs_for_select
    Org.where(is_active: true).map {|b| ["#{b.name}",b.id]}
  end
  #当前登录用户可使用的的org
  def current_ability_orgs_for_select
    default_org = current_user.current_org
    ret = ActiveSupport::OrderedHash.new
    ret["#{default_org.name}"] = default_org.id
    default_org.children.each {|child_org|  ret["#{child_org.name}"] = child_org.id}
    ret
  end
end
