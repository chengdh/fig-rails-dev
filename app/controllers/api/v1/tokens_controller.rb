#coding: utf-8
#devise token处理
#参考http://matteomelani.wordpress.com/2011/10/17/authentication-for-mobile-devices/
class Api::V1::TokensController < ApplicationController
  skip_before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
  respond_to :json
  def create
    username = params[:username]
    password = params[:password]
    if request.format != :json
      render :status => 406, :json => {:message => "The request must be json"}
      return
    end

    if username.nil?
      render :status => 400,:json => {:message => "The request must contain the username and password."}
      return
    end
    #maximo登录
    if params[:maximo].present?
      ret = maximo_login(username,password)
      if ret[:id] > 0
        render :status => 200, :json => {:result => ret }
      else
        render :status => 401, :json => {:message => "Invalid username or password."}
      end
    else
      user = erp_login(username)
      if user.present?
        render :status => 200, :json => {:result => user}
      else
        logger.info("User #{username} failed signin ")
        render :status => 401, :json => {:message => "Invalid username ."}
      end
    end
  end

  def destroy
    @user=User.find_by_authentication_token(params[:id])
    if @user.nil?
      logger.info("Token not found.")
      render :status => 404, :json => {:message => "Invalid token." }
    else
      @user.reset_authentication_token!
      render :status => 200, :json => {:token => params[:id]}
    end
  end

  #POST 测试服务器连接
  #/api/v1/tokens/test_connect.json
  def test_connect
    render :status => 200,:json => {:result => "ok"}
  end
  private
  #maximo 登录
  def maximo_login(username,pwd)
    ret = MaximoLogin.login(username,pwd)
    if ret[:id] > 0
      if UsersLogin.exists?(:user_id => ret[:id])
        user_login = UsersLogin.find_by(user_id: ret[:id])
        user_login.update_attributes(login_date: DateTime.now)
      else
        UsersLogin.create!(user_id: ret[:id],username: username,login_date: DateTime.now)
      end
    end
    ret
  end

  #erp 货物用户信息
  def erp_login(username)
    user = SoapLogin.get_user(username)
    user
  end
  def fake_login
    {id: 1292,username: username,password: password,real_name: username,default_org_id: 1,authentication_token: "token"}
  end
end
