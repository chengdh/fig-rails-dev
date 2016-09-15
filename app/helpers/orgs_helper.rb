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

  #将当前可用机构转化为json
  def current_ability_orgs_json
    default_org = current_user.current_org
    default_org.to_json(methods: [:text,:nodes],include: {nodes: {methods: [:text,:nodes],include: {nodes: {methods: [:text,:nodes],include: [:nodes]}}} })
    
  end
  #当期可用机构的ids
  def current_ability_org_ids
    default_org = current_user.current_org
    ret = ActiveSupport::OrderedHash.new
    child_org_ids = default_org.children.map {|child_org|  child_org.id}
    [default_org.id] + child_org_ids
  end

  #当前登录机构的二级机构
  def current_children_orgs_for_select
    default_org = current_user.current_org
    ret = ActiveSupport::OrderedHash.new
    default_org.children.each {|child_org|  ret["#{child_org.name}"] = child_org.id}
    ret
  end
end
