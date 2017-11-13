#coding: utf-8
class PoHeader < ActiveRecord::Base
  self.table_name = "po_headers_a"
  self.primary_key = "id"
  has_many :po_lines
  #审批信息
  has_many :po_action_histories,foreign_key: :object_id
  #附件
  has_many :cux_soa_attached_doc_vs, -> {where(table_name: "po_headers")},foreign_key: :pk1_column



  scope :bills_by_wf_itemkeys,-> (wf_itemkeys) {where(wf_item_key: wf_itemkeys)}

  def total_fee
    po_lines.to_a.try(:sum,&:line_amt)
  end


  def total_fee_without_tax
    po_lines.to_a.try(:sum,&:line_amt_without_tax)
  end

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
        "VNAME" => "wf_item_key",
        "VVALUE" => k,
        "VSIGN" => "EQ"
      }
      TestSoap.sync_table(self,p_item_array)
    end
    po_ids = PoHeader.where(wf_item_key: wf_item_keys).ids
    PoLine.sync_with_ebs(po_ids)
    PoActionHistory.sync_with_ebs(po_ids)
    #同步附件
    po_ids.each do |po_id|
      CuxSoaAttachedDocV.sync_with_ebs(po_id,"po_headers_a")
    end
  end
  def self.audit(user_id,username,p_to_user_id,notification_id,b_pass,audit_note)
    return {x_ret_code: '0',x_ret_message: '数据处理成功'}
    # ret = plsql.CUX_MOBILE_APP_PVT.GENERAL_APPROVAL(user_id,
    #                                                 username,
    #                                                 notification_id,
    #                                                 b_pass,
    #                                                 audit_note,
    #                                                 user_id)
    #
    #
    response = SoapApproval.general_approval(user_id,username,p_to_user_id,notification_id,b_pass,audit_note,"")
    {x_ret_code: response.body[:output_parameters][:x_ret_code],x_ret_message: response.body[:output_parameters][:x_ret_message]}
  end
end
