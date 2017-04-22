#coding: utf-8
class CuxDemand < ActiveRecord::Base
  self.table_name = "cux_demand_platform_headers_a"
  self.primary_key = "id"
  has_many :cux_demand_lines

  #审批信息
  has_many :cux_demand_audit_his,class_name: "CuxDemandAuditHis",foreign_key: :item_key,primary_key: :wf_itemkey
  #附件
  has_many :cux_soa_attached_doc_vs, -> {where(table_name: "cux_demand_platform_headers")},foreign_key: :pk1_column

  scope :bills_by_wf_itemkeys,-> (wf_itemkeys) {where(wf_itemkey: wf_itemkeys)}

  def self.unread_bills(wf_itemkeys)
    # sync_with_ebs(wf_itemkeys)
    self.bills_by_wf_itemkeys(wf_itemkeys).to_json(
      include:{ cux_demand_lines: {},
                cux_demand_audit_his: {methods: :cux_demand_id },
                cux_soa_attached_doc_vs: {
                  methods: :cux_demand_id,
                  include: {
                    fnd_documents_short_text: {methods: [:cux_soa_attached_doc_v_id]},
                    fnd_documents_short_text: {methods: [:cux_soa_attached_doc_v_id]},
                    fnd_lob: {methods: [:cux_soa_attached_doc_v_id]}
                  }
                }
    })
  end

  #通过wf_itemkey更新需求数据
  def self.sync_with_ebs(wf_item_keys)
    wf_item_keys.each do |k|
      p_item_array =  []
      p_item_array << {
        "VTYPE" => "VAR",
        "VNAME" => "wf_itemkey",
        "VVALUE" => k,
        "VSIGN" => "EQ"
      }
      TestSoap.sync_table(self,p_item_array)
    end
    cux_demand_ids = CuxDemand.where(wf_itemkey: wf_item_keys).ids
    CuxDemandLine.sync_with_ebs(cux_demand_ids)
    CuxDemandAuditHis.sync_with_ebs(wf_item_keys)
    #同步附件
    cux_demand_ids.each do |cm_id|
      CuxSoaAttachedDocV.sync_with_ebs(cm_id,"cux_demand_platform_headers")
    end
  end
  def self.audit(user_id,username,notification_id,b_pass,audit_note)
    # ret = plsql.CUX_MOBILE_APP_PVT.GENERAL_APPROVAL(user_id,
    #                                                 username,
    #                                                 notification_id,
    #                                                 b_pass,
    #                                                 audit_note,
    #                                                 user_id)
    #
    response = SoapApproval.general_approval(user_id,username,"",notification_id,b_pass,audit_note,"")
    {x_ret_code: response.body[:output_parameters][:x_ret_code],x_ret_message: response.body[:output_parameters][:x_ret_message]}
  end
end
