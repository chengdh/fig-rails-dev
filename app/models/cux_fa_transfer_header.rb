#coding: utf-8
#固定资产转移
class CuxFaTransferHeader < ActiveRecord::Base
  self.table_name = "cux_fa_transfer_headers_a"
  self.primary_key = "header_id"
  has_many :cux_fa_transfer_lines,foreign_key: :header_id
  # has_many :cux_fa_trasfer_his,foreign_key: :header_id
  #附件
  has_many :cux_soa_attached_doc_vs, -> {where(table_name: "cux_fa_transfer_headers")},foreign_key: :pk1_column

  scope :bills_by_wf_itemkeys,-> (wf_itemkeys) {where(item_key: wf_itemkeys)}

  def id
    header_id
  end
  def wf_notification
    WfNotification.where(:item_key => item_key).try(:first)
  end

  #工作流标题
  def wf_title
    wf_notification.try(:subject)
  end

  #工作流发起人
  def wf_from_user
    wf_notification.try(:from_user)
  end

  #工作流发起时间
  def wf_begin_date
    wf_notification.try(:begin_date)
  end

  def self.unread_bills(wf_itemkeys)
    # sync_with_ebs(wf_itemkeys)
    self.bills_by_wf_itemkeys(wf_itemkeys).to_json(
      # methods: [:wf_title,:wf_from_user,:wf_begin_date]
    )
  end

  def audit_his
    ret = plsql.cux_soa_mobile_app_pkg.GET_CUXFATRANS_ACTION_HISTORY(header_id)
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
  def self.audit(user_id,username,p_to_user_id,notification_id,b_pass,audit_note)
    # return {x_ret_code: '0',x_ret_message: '数据处理成功'}
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
