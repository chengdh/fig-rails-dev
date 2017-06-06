#coding: utf-8
#前期立项数据同步
class CuxPmPreProjectSoap
  extend Savon::Model
  client wsdl: "http://erptrn.cpihn.com:8002/webservices/SOAProvider/plsql/cux_soa_mobile_app_pkg/?wsdl",
    env_namespace: :soapenv,
    namespaces: {
      #   "xmlns:soapenv" => "http://schemas.xmlsoap.org/soap/envelope/",
      #   "xmlns:cux" => "http://xmlns.oracle.com/apps/cux/soaprovider/plsql/cux_soa_app_getdata_pkg/",
      #   "xmlns:get" => "http://xmlns.oracle.com/apps/cux/soaprovider/plsql/cux_soa_app_getdata_pkg/get_soa_common_data/"
      "xmlns:tns7" => "http://xmlns.oracle.com/apps/cux/soaprovider/plsql/cux_soa_mobile_app_pkg/get_prm_notify/",
      "xmlns:tns8" => "http://xmlns.oracle.com/apps/cux/soaprovider/plsql/cux_soa_mobile_app_pkg/get_prm_projects/",
      "xmlns:tns9" => "http://xmlns.oracle.com/apps/cux/soaprovider/plsql/cux_soa_mobile_app_pkg/cux_prm_approval/"
    },
    wsse_auth: ["SOA", "welcome"],
    pretty_print_xml: true,
    log: true

    operations :get_prm_notify,:get_prm_projects,:cux_prm_approval

    #获取前期立项通知
    def self.get_prm_notify(p_user_id)
      response = super(message: {
        "P_USER_ID" => p_user_id
      })
      get_prm_notify_items = response.body[:output_parameters][:get_prm_notify]

      Rails.logger.debug("get_prm_notify_items = " + get_prm_notify_items.to_s)
      return if get_prm_notify_items.blank?
      list = get_prm_notify_item[:get_prm_notify_item]

      return [] if list.blank?
      TestSoap.sync_table_v2(list,WfNotification,"notification_id")
    end

    #获取前期立项信息
    def self.get_prm_projects(n_ids)
      response = super(message: {
        "P_NOTIFICATIONS_ID" => n_id
      })
      get_prm_projects = response.body[:output_parameters][:get_prm_projects]

      Rails.logger.debug("get_prm_projects = " + get_prm_projects.to_s)
      return [] if get_prm_projects.blank?
      list = get_prm_notify_item[:get_prm_projects_item]

      return [] if list.blank?
      TestSoap.sync_table_v2(list,CuxPmPreProject)
    end

    #审批操作
    def self.approval(p_user_id,p_username,p_next_user_ids,p_project_id,p_notification_id,p_app_result_code,p_app_result_note,p_status_lookup_code= nil)
      resonse = super(message: {
          "P_USER_ID" => p_user_id,
          "P_USER_NAME" => p_username,
          "P_NEXT_LINEIDS" => p_next_user_ids,
          "P_PROJECT_ID" => p_project_id,
          "P_NOTIFICATION_ID" => p_notification_id,
          "P_APP_RESULT_CODE" => p_app_result_code,
          "P_APP_RESULT_NOTE" => p_app_result_note,
          "P_STATUS_LOOKUP_CODE" => p_status_lookup_code
        }
      )
    end

  end
