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
  # GET users/edit_password
  # 修改当前登录用户的密码
  def edit_password ; end

  #PUT users/:id/update_password
  def update_password
    @user = current_user
    if @user.update_with_password(params.require(:user).permit(:password,:current_password,:password_confirmation))
      flash[:success]="更新密码成功!"
      redirect_to :back
    else
      render :edit_password
    end
  end
end