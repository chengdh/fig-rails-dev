#coding: utf-8
#app服务
class AppServiceController < ApplicationController
  #DELETE app_service/sign_out/:user_id.json
  #用户退出
  def sign_out
    @user = User.find(params[:user_id])
    UserLog.create(user: @user,op_type: 2)
  end

  #GET app_service/users
  #用户列表
  def users
    @q = User.ransack(params[:q])
    @users = @q.result.paginate(page: params[:page], per_page: params[:per_page].present? ? params[:per_page] : 15)
  end
end
