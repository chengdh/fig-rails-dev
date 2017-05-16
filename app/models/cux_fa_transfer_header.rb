#coding: utf-8
#固定资产转移
class CuxFaTransferHeader < ActiveRecord::Base
  self.table_name = "cux_fa_transfer_headers_a"
  self.primary_key = "header_id"
  has_many :cux_fa_transfer_lines,foreign_key: :header_id
  has_many :cux_fa_trasferhis,foreign_key: :header_id
  #附件
  has_many :cux_soa_attached_doc_vs, -> {where(table_name: "cux_fa_transfer_headers")},foreign_key: :pk1_column

  scope :bills_by_wf_itemkeys,-> (wf_itemkeys) {where(item_key: wf_itemkeys)}

  def self.unread_bills(wf_itemkeys)
    # sync_with_ebs(wf_itemkeys)
    self.bills_by_wf_itemkeys(wf_itemkeys).to_json
  end

  #通过wf_itemkey更新需求数据
  def self.sync_with_ebs(wf_item_keys)
    wf_item_keys.each do |k|
      p_item_array =  []
      p_item_array << {
        "VTYPE" => "VAR",
        "VNAME" => "item_key",
        "VVALUE" => k,
        "VSIGN" => "EQ"
      }
      TestSoap.sync_table(self,p_item_array)
    end
    header_ids = where(item_key: wf_item_keys).ids
    CuxFaTransferLine.sync_with_ebs(header_ids)
    # CuxDemandAuditHis.sync_with_ebs(wf_item_keys)
    #同步附件
    header_ids.each do |h_id|
      CuxSoaAttachedDocV.sync_with_ebs(h_id,"cux_fa_transfer_headers")
    end
  end
  def self.audit(user_id,username,notification_id,b_pass,audit_note)
    return {x_ret_code: '0',x_ret_message: '数据处理成功'}
    # ret = plsql.CUX_MOBILE_APP_PVT.GENERAL_APPROVAL(user_id,
    #                                                 username,
    #                                                 notification_id,
    #                                                 b_pass,
    #                                                 audit_note,
    #                                                 user_id)
    #
    #
    response = SoapApproval.general_approval(user_id,username,"",notification_id,b_pass,audit_note,"")
    {x_ret_code: response.body[:output_parameters][:x_ret_code],x_ret_message: response.body[:output_parameters][:x_ret_message]}
  end
end
