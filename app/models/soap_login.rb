#coding: utf-8
class SoapLogin
  extend Savon::Model
  client wsdl: "http://erptrn.cpihn.com:8003/webservices/SOAProvider/plsql/cux_soa_mobile_app_pkg4/?wsdl",
    env_namespace: :soapenv,
    namespaces: {
    #   "xmlns:soapenv" => "http://schemas.xmlsoap.org/soap/envelope/",
    #   "xmlns:cux" => "http://xmlns.oracle.com/apps/cux/soaprovider/plsql/cux_soa_app_getdata_pkg/",
    #   "xmlns:get" => "http://xmlns.oracle.com/apps/cux/soaprovider/plsql/cux_soa_app_getdata_pkg/get_soa_common_data/"
      "xmlns:tns9" => "http://xmlns.oracle.com/apps/cux/soaprovider/plsql/cux_soa_mobile_app_pkg4/validate_user/"
    },
    wsse_auth: ["SOA", "welcome"],
    pretty_print_xml: true,
    log: true

    operations :validate_user

    #审批操作
    def self.validate_user(p_username,p_user_pwd)
      resonse = super(message: {
          "P_USER_NAME" => p_username,
          "P_USER_PWD" => p_user_pwd,
          "X_USER_ID" => nil,
          "X_RET_CODE" => nil,
          "X_RET_MESSAGE" => nil
        }
      )
    end
end
