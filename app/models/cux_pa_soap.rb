#coding: utf-8
#项目过程数据同步
class CuxPaSoap
  extend Savon::Model
  client wsdl: "http://erptrn.cpihn.com:8002/webservices/SOAProvider/plsql/cux_soa_mobile_app_pkg/?wsdl",
    env_namespace: :soapenv,
    namespaces: {
      #   "xmlns:soapenv" => "http://schemas.xmlsoap.org/soap/envelope/",
      #   "xmlns:cux" => "http://xmlns.oracle.com/apps/cux/soaprovider/plsql/cux_soa_app_getdata_pkg/",
      #   "xmlns:get" => "http://xmlns.oracle.com/apps/cux/soaprovider/plsql/cux_soa_app_getdata_pkg/get_soa_common_data/"
      "xmlns:tns5" => "http://xmlns.oracle.com/apps/cux/soaprovider/plsql/cux_soa_mobile_app_pkg/get_pa_pro_info/",
      "xmlns:tns6" => "http://xmlns.oracle.com/apps/cux/soaprovider/plsql/cux_soa_mobile_app_pkg/get_pa_budet_info/"
    },
    wsse_auth: ["SOA", "welcome"],
    pretty_print_xml: true,
    log: true

    operations :get_pa_pro_info,:get_pa_budet_info

    #获取项目过程信息
    def self.get_pa_pro_info(wf_notify_ids)
      response = super(message: {
        "NID" => wf_notify_ids.join(",")
      })
      get_pa_pro_info = response.body[:output_parameters][:get_pa_pro_info]

      Rails.logger.debug("get_pa_pro_info = " + get_pa_pro_info.to_s)
      return if get_pa_pro_info.blank?
      list = get_pa_pro_info[:get_pa_pro_info_item]

      return [] if list.blank?
      TestSoap.sync_table_v2(list,CuxPa)
    end

    #获取项目任务预算明细信息
    def self.get_pa_budet_info(project_id)
      response = super(message: {
        "P_PROJECT_ID" => project_id
      })

      x_pa_task_infos = response.body[:output_parameters][:x_pa_task_infos]
      return if x_pa_task_infos.blank?
      list = x_pa_task_infos[:x_pa_task_infos_item]
      return [] if list.blank?
      TestSoap.sync_table_v2(list,CuxPaTask)
    end
end
