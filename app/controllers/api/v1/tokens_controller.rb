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
    # render :status => 200, :json => {:result =>
    #                                    {id: 3492,username: username,password: password,real_name: username,default_org_id: 1,authentication_token: "token"}
    # }
    # return


    response = SoapLogin.validate_user(username,password)
    logger.debug("validate_user:" + response.body.to_s)
    ret = {x_user_id: response.body[:output_parameters][:x_user_id],
           x_ret_code: response.body[:output_parameters][:x_ret_code],
           x_ret_message: response.body[:output_parameters][:x_ret_message]}

    logger.debug("login ret:" + ret.to_s)

    login_success = ret[:x_ret_code].eql?('0')

    # p_business_type = "FND_USER_A"
    # parameters_item_array = [
    #   {
    #     "VTYPE" => "VAR",
    #     "VNAME" => "user_name",
    #     "VVALUE" => username,
    #     "VSIGN" => "EQ"
    #   }
    # ]
    # response = TestSoap.get_soa_common_data(p_business_type,parameters_item_array)
    # business_result = Hash.from_xml(response.body[:output_parameters][:get_soa_common_data])["BUSINESS_RESULT"]
    # business_data_list = business_result["BUSINESS_DATA_LIST"]
    #
    # login_success = true
    #
    # logger.debug("return business_data_list = " + business_data_list.to_s)
    # login_success = false if business_data_list.blank?
    #
    # list = business_data_list["BUSINESS_DATA"]
    # logger.debug("return business data = " + list.to_s)
    # login_success = false  if list.blank?
    #
    # user_record = list if list.kind_of?(Hash)
    #
    # user_record = list.first if list.kind_of?(Array)
    #
    # logger.debug("user_record = " + user_record.to_s)
    #
    #登录正常
    if login_success
      render :status => 200, :json => {:result =>
                                       {
                                         id: ret[:x_user_id],
                                         username: username,
                                         password: "password",
                                         real_name:  username,
                                         default_org_id: 1,
                                         authentication_token: "token"
                                       }
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
