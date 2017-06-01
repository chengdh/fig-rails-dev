#coding: utf-8
class MaximoLogin
  extend Savon::Model
  #client wsdl: "http://192.168.77.212:7001/maximo_mh/TaskAgentsService?wsdl",
  client wsdl: "http://192.168.77.211/maximo_mh/MaximoLoginService?wsdl",
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

  operations :task_appro_val

  #获取表数据
  def self.task_appro_val(username,passwd)
    super(message: {
      "arg0" => username,
      "arg1" => passwd
    })
  end

  #同步表数据
  def self.login(username,passwd)
    response = task_appro_val(username,passwd)
    {id: response.body[:task_appro_val_response][:return].to_i,username: username,password: password,default_org_id: 1,authentication_token: "token"}
  end
end
