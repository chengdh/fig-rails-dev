#coding: utf-8
#项目过程数据同步
class CuxPaSoap
  extend Savon::Model
  client wsdl: "http://erptrn.cpihn.com:8003/webservices/SOAProvider/plsql/cux_soa_mobile_app_pkg3/?wsdl",
    env_namespace: :soapenv,
    namespaces: {
      #   "xmlns:soapenv" => "http://schemas.xmlsoap.org/soap/envelope/",
      #   "xmlns:cux" => "http://xmlns.oracle.com/apps/cux/soaprovider/plsql/cux_soa_app_getdata_pkg/",
      #   "xmlns:get" => "http://xmlns.oracle.com/apps/cux/soaprovider/plsql/cux_soa_app_getdata_pkg/get_soa_common_data/"
      "xmlns:tns7" => "http://xmlns.oracle.com/apps/cux/soaprovider/plsql/cux_soa_mobile_app_pkg2/get_pa_pro_info/",
      "xmlns:tns8" => "http://xmlns.oracle.com/apps/cux/soaprovider/plsql/cux_soa_mobile_app_pkg2/get_pa_budet_info/"
    },
    wsse_auth: ["SOA", "welcome"],
    pretty_print_xml: true,
    log: true

    operations :get_pa_pro_info,:get_pa_budet_info

    #获取项目过程信息
    def self.get_pa_pro_info(wf_notify_ids)
      response = super(message: {
        "N_ID" => wf_notify_ids.join(",")
      })
      get_pa_pro_info = response.body[:output_parameters][:get_pa_pro_info]

      Rails.logger.debug("get_pa_pro_info = " + get_pa_pro_info.to_s)
      return if get_pa_pro_info.blank?
      list = get_pa_pro_info[:get_pa_pro_info_item]

      return [] if list.blank?
      TestSoap.sync_table_v2(list,CuxPa)
    end

    #获取项目任务预算明细信息
    #FIXME 接口文档中未提供数据样例
    def self.get_pa_budet_info(project_id)
      super(message: {
        "P_PROJECT_ID" => project_id
      })
    end
end
