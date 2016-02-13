#coding: utf-8
class UsersController < BaseController
  table :username,:real_name,:is_active,:is_admin,:default_org_id,:default_role_id,:current_sign_in_at,:last_sign_in_at,:current_sign_in_ip,:last_sign_in_ip

  #PUT users/:id/update_default
  #更新默认机构及默认角色
  def update_default_attr
    attrs = params.require(:user).permit(:default_org_id,:default_role_id)
    user = User.find(params[:id])
    user.update_attributes(attrs)
    redirect_to :back
  end
end
