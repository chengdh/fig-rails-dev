#coding: utf-8
class TestSoap
  extend Savon::Model
  client wsdl: "http://erptrn.cpihn.com:8003/webservices/SOAProvider/plsql/cux_soa_app_approval_pkg/?wsdl",
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


    operations :echo,:sum

    #获取表数据
    def self.get_soa_common_data(p_business_type,p_parameters_item_array = [] )
      super(message: {
        InputParameters: {
          p_org_id: "?",
          p_business_type: p_business_type,
          p_parameters: {
            p_parameters_item: p_parameters_item_array
          }
        }
      })
    end
end
