#coding: utf-8
class UsersController < BaseController
  skip_load_and_authorize_resource only: [:show_login_page,:show_query_salary,:get_mth_salary]
  skip_before_filter :authenticate_user!, only: [:show_query_salary,:show_login_page,:get_mth_salary]
  #参考 http://stackoverflow.com/questions/18445782/how-to-override-x-frame-options-for-a-controller-or-action-in-rails-4
  after_action :allow_iframe, only: [:show_login_page,:show_query_salary,:get_mth_salary]
  table :username,:real_name,:is_active,:is_admin,:default_org_id,:default_role_id,
    :current_sign_in_at,:last_sign_in_at,:current_sign_in_ip,:last_sign_in_ip

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

  #GET users/show_login_page
  #显示登录界面
  def show_login_page
    render layout: "devise"
  end

  #GET users/show_query_salary
  #显示工资查询界面
  def show_query_salary
    render layout: "devise"
  end
  #GET users/get_mth_salary
  #获取给给定月份的工资信息
  def get_mth_salary
    valid = true
    @salary_info = {}
    user = User.find_by(username: params[:salary_query][:login])
    if user.blank?
      valid = false
      flash[:error] = "用户名不存在!"
    else
      valid = user.valid_password?(params[:salary_query][:password])
      flash[:error] = "您输入的密码不正确!" unless valid
    end
    if valid
      employee = user.get_employee_ref
      if employee.blank?
        valid = false
        flash[:error] = "未找到关联的员工资料!"
      end
    end

    @salary_info = employee.get_salary_detail_by_mth(params[:salary_query][:mth]) if valid
    render layout: "devise"
  end

  def resource_name
    :user
  end
  def resource
    @resource ||= User.new
  end
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  private
  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end
end
