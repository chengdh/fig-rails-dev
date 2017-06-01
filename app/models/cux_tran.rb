#coding: utf-8
#领退料计划
class CuxTran < ActiveRecord::Base
  self.table_name = "cux_transaction_headers_all_a"
  self.primary_key = "id"
  has_many :cux_tran_lines,foreign_key: :require_id
  has_many :cux_tran_activity_histray_as,foreign_key: :item_key,primary_key: :wf_itemkey
  has_many :cux_soa_attached_doc_vs, -> {where(table_name: "cux_transaction_headers_all")},foreign_key: :pk1_column

  scope :bills_by_wf_itemkeys,-> (wf_itemkeys) {where(wf_itemkey: wf_itemkeys)}

  def self.unread_bills_all(wf_itemkeys)
    where(wf_itemkey: wf_itemkeys).to_json(
      include:{
        cux_tran_lines: {methods: [:cux_tran_id]},
        cux_tran_activity_histray_as: {methods: :cux_tran_id },
        cux_soa_attached_doc_vs: {
          methods: :cux_tran_id,
          include: {
            fnd_documents_short_text: {methods: [:cux_soa_attached_doc_v_id]},
            fnd_documents_short_text: {methods: [:cux_soa_attached_doc_v_id]},
            fnd_lob: {methods: [:cux_soa_attached_doc_v_id]}
          }
        }
      })
  end
  def self.unread_bills(wf_itemkeys,business_type)
    # sync_with_ebs(wf_itemkeys)
    where(wf_itemkey: wf_itemkeys,business_type: business_type).to_json(
      include:{
        cux_tran_lines: {methods: [:cux_tran_id]},
        cux_tran_activity_histray_as: {methods: :cux_tran_id },
        cux_soa_attached_doc_vs: {
          methods: :cux_tran_id,
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
      p_item_array =[]
      p_item_array << {
        "VTYPE" => "VAR",
        "VNAME" => "wf_itemkey",
        "VVALUE" => k,
        "VSIGN" => "EQ"
      }
      TestSoap.sync_table(self,p_item_array)
    end
    cux_tran_ids = CuxTran.where(wf_itemkey: wf_item_keys).ids
    CuxTranLine.sync_with_ebs(cux_tran_ids)
    CuxTranActivityHistrayA.sync_with_ebs(wf_item_keys)
    #同步附件
    cux_tran_ids.each do |ct_id|
      CuxSoaAttachedDocV.sync_with_ebs(ct_id,"cux_transaction_headers_all")
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