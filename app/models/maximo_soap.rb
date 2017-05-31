#coding: utf-8
class MaximoSoap
  extend Savon::Model
  client wsdl: "http://192.168.77.211/maximo_mh/TaskAgentsService?wsdl",
    env_namespace: :soapenv,
    # namespaces: {
    #   "xmlns:soapenv" => "http://schemas.xmlsoap.org/soap/envelope/",
    #   "xmlns:cux" => "http://xmlns.oracle.com/apps/cux/soaprovider/plsql/cux_soa_app_getdata_pkg/",
    #   "xmlns:get" => "http://xmlns.oracle.com/apps/cux/soaprovider/plsql/cux_soa_app_getdata_pkg/get_soa_common_data/"
    #   "xmlns:tns1" => "http://xmlns.oracle.com/apps/cux/soaprovider/plsql/cux_soa_app_getdata_pkg/get_soa_common_data/"
    # },
    # wsse_auth: ["SOA", "welcome"],
    pretty_print_xml: true,
    log: true

  operations :TaskAgent

  #获取表数据
  def self.task_agent(username,from_row,to_row)
    super(message: {
      "arg0" => username,
      "arg1" => from_row,
      "arg2" => to_row
    })
  end

  #同步表数据
  def self.sync_table(model_clazz,username,from_row,to_row)
    response = task_agent(username,from_row,to_row)
    business_result = Hash.from_xml(response.body[:task_agent_response][:return])
    list = business_result["root"]["datalist"]["user"]
    list.each do |record|
      #删除不需要的属性
      record.delete_if {|k,v| !model_clazz.column_names.include?(k.downcase)}
      id = record.delete("orderid")
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
end
