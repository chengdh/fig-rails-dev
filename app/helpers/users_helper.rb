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
end
