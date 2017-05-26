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
      super(message: {
        "N_ID" => wf_notify_ids.join(",")
      })
    end

    #获取项目任务预算明细信息
    def self.get_pa_budet_info(project_id)
      super(message: {
        "P_PROJECT_ID" => project_id
      })
    end


    #同步表数据
    def self.sync_table(model_clazz,p_item_array)
      response = get_soa_common_data(model_clazz.table_name.upcase,p_item_array)
      business_result = Hash.from_xml(response.body[:output_parameters][:get_soa_common_data])["BUSINESS_RESULT"]
      business_data_list = business_result["BUSINESS_DATA_LIST"]

      Rails.logger.debug("return business_data_list = " + business_data_list.to_s)
      return if business_data_list.blank?

      list = business_data_list["BUSINESS_DATA"]
      Rails.logger.debug("return business data = " + list.to_s)

      ret_ids = []
      return ret_ids if list.blank?

      pk = model_clazz.primary_key
      if list.kind_of?(Array)
        list.each do |record|
          #删除不需要的属性
          record.delete_if {|k,v| !model_clazz.column_names.include?(k.downcase)}
          id = record.delete(pk.upcase)
          ret_ids << id
          new_hash = {}
          record.each do |k,v|
            new_hash.merge!({k.downcase => v})
          end
          #如果存在数据则更新
          wf_exists = model_clazz.exists?(id)
          if wf_exists
            model = model_clazz.find(id)
            model.update_attributes(new_hash)
          else
            wf = model_clazz.new(new_hash)
            wf.id = id
            wf.save!
          end
        end
      end
      if list.kind_of?(Hash)
        record = list
        #删除不需要的属性
        record.delete_if {|k,v| !model_clazz.column_names.include?(k.downcase)}
        id = record.delete(pk.upcase)
        ret_ids << id
        new_hash = {}
        record.each do |k,v|
          new_hash.merge!({k.downcase => v})
        end
        #如果存在数据则更新
        wf_exists = model_clazz.exists?(id)
        if wf_exists
          model = model_clazz.find(id)
          model.update_attributes(new_hash)
        else
          wf = model_clazz.new(new_hash)
          wf.id = id
          wf.save!
        end
      end
      ret_ids
    end
end
