#coding: utf-8
#应付发票
class CuxApInvoice < ActiveRecord::Base
  self.table_name = "cux_ap_invoices_a"
  has_many :cux_ap_invoice_lines,foreign_key: :invoice_id
  #审批信息
  has_many :ap_wfapproval_histories,foreign_key: :invoice_id
  #附件
  has_many :cux_soa_attached_doc_vs, -> {where(table_name: "AP_INVOICES")},foreign_key: :pk1_column

  scope :bills_by_wf_itemkeys,-> (wf_itemkeys) {where(id: wf_itemkeys.map {|item_key| item_key.split("_").try(:first)})}

  def self.unread_bills(wf_itemkeys)
    # sync_with_ebs(wf_itemkeys)
    self.bills_by_wf_itemkeys(wf_itemkeys).to_json()
  end

  #通过wf_itemkey更新需求数据
  #通知表中ITEM_KEY,去掉"_"以及后的数字，为发票ID
  def self.sync_with_ebs(wf_item_keys)
    ids = []
    wf_item_keys.each do |k|
      id = k.split("_").try(:first)
      if id.present?
        ids << id
        p_item_array =  []
        p_item_array << {
          "VTYPE" => "NUM",
          "VNAME" => "id",
          "VVALUE" => k,
          "VSIGN" => "EQ"
        }
        TestSoap.sync_table(self,p_item_array)
      end
    end
    CuxApInvoiceLine.sync_with_ebs(ids)
    ApWfapprovalHistory.sync_with_ebs(ids)
    #同步附件
    ids.each do |ap_id|
      CuxSoaAttachedDocV.sync_with_ebs(ap_id,"AP_INVOICES")
    end
  end
  def self.audit(user_id,username,notification_id,b_pass,audit_note)
    # return {x_ret_code: '0',x_ret_message: '数据处理成功'}
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