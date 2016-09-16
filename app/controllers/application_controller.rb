class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end
  #当前可用机构的ids
  #递归获取所有子节点
  #参考http://stackoverflow.com/questions/2549320/looping-through-an-object-tree-recursively
  def recursive_orgs(p_org,ref_return)
    p_org.children.each do |c_org|
      ref_return.push(c_org)
      recursive_orgs(c_org,ref_return)
    end
  end

  def current_ability_orgs
    default_org = current_user.current_org
    ret_orgs = [default_org]
    recursive_orgs(default_org,ret_orgs)
    ret_orgs
  end

  def current_ability_org_ids
    default_org = current_user.current_org
    ret_orgs = [default_org]
    recursive_orgs(default_org,ret_orgs)
    ret_orgs.map {|o| o.id}
  end

end
