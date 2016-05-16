#coding: utf-8
#用户登入-登出 日志
class UserLogsController < ApplicationController
  def index
    @q = UserLog.ransack(params[:q])
    @user_logs = @q.result
  end
end
