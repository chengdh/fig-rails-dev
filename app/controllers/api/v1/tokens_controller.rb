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

    if username.nil? or password.nil?
      render :status => 400,:json => {:message => "The request must contain the username and password."}
      return
    end

    #FIXME 测试用
    render :status => 200, :json => {:result =>
                                       {id: 1,username: username,password: password,real_name: username,default_org_id: 1,authentication_token: "token"}
    }
    return

    x_user_id = -1
    x_ret_code = '-1'
    x_ret_message = ""
    ret = plsql.CUX_MOBILE_APP_PVT.VALIDATE_USER(username,password)

    #登录正常
    if ret[:x_ret_code].eql?('0')
      render :status => 200, :json => {:result => 
                                       {id: ret[:x_user_id],username: username,password: password,real_name: username,default_org_id: 1,authentication_token: "token"}
      }
    else
      logger.info("User #{username} failed signin, password \"#{password}\" is invalid")
      render :status => 401, :json => {:message => "Invalid username or password."}
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
end
