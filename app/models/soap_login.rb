#coding: utf-8
class SoapLogin
  extend Savon::Model
  client wsdl: "http://erptrn.cpihn.com:8002/webservices/SOAProvider/plsql/cux_soa_mobile_app_pkg/?wsdl",
    env_namespace: :soapenv,
    namespaces: {
    #   "xmlns:soapenv" => "http://schemas.xmlsoap.org/soap/envelope/",
    #   "xmlns:cux" => "http://xmlns.oracle.com/apps/cux/soaprovider/plsql/cux_soa_app_getdata_pkg/",
    #   "xmlns:get" => "http://xmlns.oracle.com/apps/cux/soaprovider/plsql/cux_soa_app_getdata_pkg/get_soa_common_data/"
      "xmlns:tns10" => "http://xmlns.oracle.com/apps/cux/soaprovider/plsql/cux_soa_mobile_app_pkg/validate_user/"
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

    #获取用户信息
    def self.get_user(p_username)
      p_item_array =  []
      p_item_array << {
        "VTYPE" => "VAR",
        "VNAME" => "user_name",
        "VVALUE" => p_username,
        "VSIGN" => "EQ"
      }
      response = TestSoap.get_soa_common_data("FND_USER_A",p_item_array)
      get_soa_common_data = response.body[:output_parameters][:get_soa_common_data]
      return if get_soa_common_data.blank? or get_soa_common_data.eql?("N")
      business_result = Hash.from_xml(get_soa_common_data)["BUSINESS_RESULT"]
      business_data_list = business_result["BUSINESS_DATA_LIST"]

      Rails.logger.debug("return business_data_list = " + business_data_list.to_s)
      return if business_data_list.blank?

      list = business_data_list["BUSINESS_DATA"]
      Rails.logger.debug("return business data = " + list.to_s)

      return nil if list.blank?
      user = list.first
      ret = {
        id: user["id"],
        username: user["username"],
        password: "password",
        real_name:  user["username"],
        default_org_id: 1,
        authentication_token: "token"
      }
    end
end
