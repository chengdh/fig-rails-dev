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

  #POST app_service/reset_password.json
  #重设密码
  def reset_password
    @user = User.find(params[:user][:id])
    verify_code = VerifySm.find_by(mobile: params[:user][:phone],verity_type: '2').try(:verify_code)
    if verify_code.blank? or not params[:user][:verify_code].eql?(verify_code)
      @user.errors.add(:verify_code,"验证码不正确")
    else
      @user.update(user_params)
    end
  end

  #GET app_service/payment_callback
  #易接付费调用接口
  #参考https://www.1sdk.cn/omsdk-sdkenter-online/omsdk-sdkenter-server1/omsdk-sdkenter-server-consume.html
  def payment_callback
    #判断订单号是否重复
    payment_params = params.permit(:app,:cbi,:ct,:fee,:pt,:sdk,:ssid,:st,:tcd,:uid,:ver,:sign)
    tcd = payment_params[:tcd]
    user_id = payment_params[:cbi].to_i
    if not Payment.exists?(tcd: tcd)
      payment = Payment.create!(payment_params)
    end
    render body: "SUCCESS"
  end
  private
  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
