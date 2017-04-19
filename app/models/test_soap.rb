#coding: utf-8
class TestSoap
  extend Savon::Model
  client wsdl: "http://erptrn.cpihn.com:8003/webservices/SOAProvider/plsql/cux_soa_app_getdata_pkg/?wsdl",
    env_namespace: :soapenv,
    namespaces: {
      #   "xmlns:soapenv" => "http://schemas.xmlsoap.org/soap/envelope/",
      #   "xmlns:cux" => "http://xmlns.oracle.com/apps/cux/soaprovider/plsql/cux_soa_app_getdata_pkg/",
      #   "xmlns:get" => "http://xmlns.oracle.com/apps/cux/soaprovider/plsql/cux_soa_app_getdata_pkg/get_soa_common_data/"
      "xmlns:tns1" => "http://xmlns.oracle.com/apps/cux/soaprovider/plsql/cux_soa_app_getdata_pkg/get_soa_common_data/"
    },
    wsse_auth: ["SOA", "welcome"],
    pretty_print_xml: true,
    log: true

    operations :echo,:sum,:get_soa_common_data

    #获取表数据
    def self.get_soa_common_data(p_business_type,p_parameters_item_array = [] )
      super(message: {
        "P_BUSINESS_TYPE" => p_business_type,
        "P_PARAMETERS" => {
          "P_PARAMETERS_ITEM" => p_parameters_item_array
        }
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
