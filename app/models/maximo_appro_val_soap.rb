#coding: utf-8
class MaximoApproValSoap
  extend Savon::Model
  client wsdl: "http://192.168.77.211/maximo_mh/MaximoTaskAppService?wsdl",
    # client wsdl: "http://192.168.77.212:7001/maximo_mh/TaskAgentsService?wsdl",
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
  operations :task_appro_val

  #数据审批
  #appro 审批人工号
  #assignid 任务ID ，同上接口任务ID assignid
  #ispositive 审批结果（0不通过，1通过)
  #evaluate_caluse 审批意见-
  #evaluate 评价结果（优、良、差）
  def self.task_appro_val(appro,assignid,ispositive,evaluate_caluse,evaluate)
    task = MaximoMsg.find(assignid)
    return unless task.present?
    args = {
      web: {
        assignid: assignid,
        processname: task.ordertaskname,
        processrev: task.processrev,
        ownernodeid: task.nodeid,
        ispositive: ispositive,
        evaluate_caluse: evaluate_caluse,
        appro: appro,
        evaluate: evaluate
      }
    }

    super(message: args.to_xml(root: :datas))
  end
end



