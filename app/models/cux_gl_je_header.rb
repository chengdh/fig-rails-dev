#coding: utf-8
#总账日记账
class CuxGlJeHeader < ActiveRecord::Base
  self.table_name = "cux_gl_je_headers_a"
  self.primary_key = "id"

  has_many :cux_gl_je_lines,foreign_key: :je_header_id

  scope :bills_by_wf_itemkeys,-> (wf_itemkeys) {where(je_batch_id: wf_itemkeys.map {|item_key| item_key.split("*").try(:first)})}

  def wf_notification
    WfNotification.where(["message_type=? and item_key like '?*%'",'GLBATCH',je_batch_id]).try(:first)
  end
  def id
    "#{attributes['id']}#{attributes['je_batch_id']}"
  end

  def origin_id
    attributes["id"]
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
      methods: [:id,:origin_id]
      # methods: [:wf_title,:wf_from_user,:wf_begin_date]
    )
  end

  #通过wf_itemkey更新需求数据
  #通知表中ITEM_KEY,去掉"*"以及后的数字，为ID
  def self.sync_with_ebs(wf_item_keys)
    ids = []
    wf_item_keys.each do |k|
      id = k.split("*").try(:first)
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
    CuxGlJeLine.sync_with_ebs(ids)
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
