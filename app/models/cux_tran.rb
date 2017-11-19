#coding: utf-8
#领退料计划
class CuxTran < ActiveRecord::Base
  self.table_name = "cux_transaction_headers_all_a"
  self.primary_key = "id"
  has_many :cux_tran_lines,foreign_key: :require_id
  has_many :cux_tran_activity_histray_as,foreign_key: :item_key,primary_key: :wf_itemkey
  has_many :cux_soa_attached_doc_vs, -> {where(table_name: "cux_transaction_headers_all")},foreign_key: :pk1_column

  scope :bills_by_wf_itemkeys,-> (wf_itemkeys) {where(wf_itemkey: wf_itemkeys)}

  BUSINESS_TYPE = {
    "NORMAL" => "领料单",
    "RETURN" => "退料单",
    "PROFIT" => "盘盈调整",
    "LOSSES" => "盘亏调整",
    "SALE" => "物资销售出库",
    "REFUND" => " 物资销售退回",
    "OLD_ITEM_IN" => "旧件物资回收/取消",
    "ASSETS_IN" => "固资代保管入库",
    "ASSETS_OUT" => "固资代保管出库	",
    "TOOL_OUT" => "工器具领用",
    "TOOL_IN" => "工器具归还",
    "WASTE" => "废旧物资入库",
    "SJBJ_IN" => "随机备件入库",
    "RECYCLE" => "修旧利费入库",
    "SCRAP" => "物资报废"
  }

  def wf_notification
    WfNotification.where(:item_key => wf_itemkey).try(:first)
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

  def self.unread_bills_all(wf_itemkeys)
    where(wf_itemkey: wf_itemkeys).to_json(
      # methods: [:wf_title,:wf_from_user,:wf_begin_date],
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


  def self.audit(user_id,username,p_to_user_id,notification_id,b_pass,audit_note)
    # ret = plsql.CUX_MOBILE_APP_PVT.GENERAL_APPROVAL(user_id,
    #                                                 username,
    #                                                 notification_id,
    #                                                 b_pass,
    #                                                 audit_note,
    #                                                 user_id)
    #
    response = SoapApproval.general_approval(user_id,username,p_to_user_id,notification_id,b_pass,audit_note,"")
    {x_ret_code: response.body[:output_parameters][:x_ret_code],x_ret_message: response.body[:output_parameters][:x_ret_message]}
  end
end
