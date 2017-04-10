#coding: utf-8
class SoapApproval
  extend Savon::Model
  client wsdl: "http://erptrn.cpihn.com:8003/webservices/SOAProvider/plsql/cux_soa_app_getdata_pkg/?wsdl",
    env_namespace: :soapenv,
    namespaces: {
      "xmlns:v2" => "http://v2.example.com",
    },
    soap_header: {
      Security: {
        UsernameToken: {
          Username: "SOA",
          Password: "welcome"
        }
      }

    },
    pretty_print_xml: true,
    log: true

    #审批操作
    def self.general_approval(p_user_id,p_username,p_to_user,p_notification_id,p_app_result_code,p_app_result_note,p_login_id = nil)
      super(message: {
        InputParameters: {
          p_user_id: p_user_id,
          p_username: p_username,
          p_to_user: p_to_user,
          p_notification_id: p_notification_id,
          p_app_result_code: p_app_result_code,
          p_app_result_note: p_app_result_note,
          p_login_id: p_login_id
        }
      })
    end
end
