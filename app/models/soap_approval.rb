#coding: utf-8
class SoapApproval
  extend Savon::Model
  client wsdl: "http://erptrn.cpihn.com:8002/webservices/SOAProvider/plsql/cux_soa_app_approval_pkg/?wsdl",
    env_namespace: :soapenv,
    namespaces: {
    #   "xmlns:soapenv" => "http://schemas.xmlsoap.org/soap/envelope/",
    #   "xmlns:cux" => "http://xmlns.oracle.com/apps/cux/soaprovider/plsql/cux_soa_app_getdata_pkg/",
    #   "xmlns:get" => "http://xmlns.oracle.com/apps/cux/soaprovider/plsql/cux_soa_app_getdata_pkg/get_soa_common_data/"
      "xmlns:tns1" => "http://xmlns.oracle.com/apps/cux/soaprovider/plsql/cux_soa_app_approval_pkg/general_approval/"
    },
    wsse_auth: ["SOA", "welcome"],
    pretty_print_xml: true,
    log: true


    operations :general_approval

    #审批操作
    def self.general_approval(p_user_id,p_username,p_to_user,p_notification_id,p_app_result_code,p_app_result_note,p_login_id = nil)
      resonse = super(message: {
          "P_USER_ID" => p_user_id,
          "P_USER_NAME" => p_username,
          "P_TO_USER" => p_to_user,
          "P_NOTIFICATION_ID" => p_notification_id,
          "P_APP_RESULT_CODE" => p_app_result_code,
          "P_APP_RESULT_NOTE" => p_app_result_note,
          "P_LOGIN_ID" => p_login_id
        }
      )
    end
end
