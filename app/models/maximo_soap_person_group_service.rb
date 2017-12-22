class MaximoSoapPersonGroupService
  extend Savon::Model
    #test env
    client wsdl: "http://192.168.77.211/maximo_mh/MaximoPersonGroupService?wsdl",
    #production env
    #client wsdl: "http://192.168.77.212:7001/maximo_mh/changepwd?wsdl",
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

  operations :person_agent

  #获取表数据
  def self.person_agent(groupid)
    super(message: {
      "arg0" => groupid,
    })
  end
  def self.get_groupname(groupid)
    return "" if groupid.blank?
    response = person_agent(groupid.to_s)
    return_data = Hash.from_xml(response.body[:person_agent_response][:return])
    return "" if return_data.blank? or return_data["root"].blank? or return_data["root"]["data"].blank?
    return_data["root"]["data"]["description"]
  end
end
