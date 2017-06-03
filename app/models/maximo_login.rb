#coding: utf-8
class MaximoLogin
  extend Savon::Model
  client wsdl: "http://192.168.77.212:7001/maximo_mh/MaximoLoginService?wsdl",
  # client wsdl: "http://192.168.77.211/maximo_mh/MaximoLoginService?wsdl",
    env_namespace: :soapenv,
    # namespaces: {
    #   "xmlns:soapenv" => "http://schemas.xmlsoap.org/soap/envelope/",
    #   "xmlns:cux" => "http://xmlns.oracle.com/apps/cux/soaprovider/plsql/cux_soa_app_getdata_pkg/",
    #   "xmlns:get" => "http://xmlns.oracle.com/apps/cux/soaprovider/plsql/cux_soa_app_getdata_pkg/get_soa_common_data/"
    #   "xmlns:tns1" => "http://xmlns.oracle.com/apps/cux/soaprovider/plsql/cux_soa_app_getdata_pkg/get_soa_common_data/"
    # },
    # wsse_auth: ["SOA", "welcome"],
    pretty_print_xml: true,
    log: true

  operations :user_login

  #获取表数据
  def self.user_login(username,passwd)
    super(message: {
      "arg0" => username,
      "arg1" => passwd
    })
  end

  #同步表数据
  def self.login(username,passwd)
    response = user_login(username,passwd)
    ret = {id: response.body[:user_login_response][:return].to_i,
           username: username,
           password: passwd,
           default_org_id: 1,
           real_name: username,
           authentication_token: "token"
    }
    # ret = {id: 100,username: '00163150',password: passwd,real_name: username,default_org_id: 1,authentication_token: "token"}
    #登录后同步数据
    if ret[:id] > 0
      MaximoMsg.sync_with_maximo(username)
    end
    ret
  end
end
