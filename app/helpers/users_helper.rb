#coding: utf-8
module UsersHelper
  #当前用户角色选择
  def current_user_roles_for_select
    current_user.roles.map {|r| [r.name,r.id]}
  end

  #当前用户机构选择
  def current_user_orgs_for_select
    current_user.orgs.map {|r| [r.name,r.id]}
  end
  #当前可用用户选择
  def users_for_select
    ret = []
    User.where(is_active: true).each do |u|
      is_include = false
      current_user.current_ability_org_ids.each do |org_id|
        is_include = true if  u.current_ability_org_ids.include?(org_id)
      end
      ret.push(u) if is_include
    end
    ret.map {|u| [u.real_name,u.id]}
  end
end
