#coding: utf-8
class CuxDemand < ActiveRecord::Base
  self.table_name = "cux_demand_platform_headers_a"
  self.primary_key = "id"
  has_many :cux_demand_lines
  scope :bills_by_wf_itemkeys,-> (wf_itemkeys) {where(wf_itemkey: wf_itemkeys).includes(:cux_demand_lines)}

  def self.unread_bills(wf_itemkeys)
    self.bills_by_wf_itemkeys(wf_itemkeys).to_json(include: :cux_demand_lines)
  end

  def self.audit(user_id,username,notification_id,b_pass,audit_note)
    x_login_id = -1
    x_ret_code = '-1'
    x_ret_message = ''
    # ret = plsql.CUX_MOBILE_APP_PVT.GENERAL_APPROVAL(user_id,username,notification_id,b_pass,audit_note,x_login_id,x_ret_code,x_ret_message)
    #{x_ret_code: x_ret_code,x_ret_message: x_ret_message}
    {x_ret_code: '0',x_ret_message: 'success'}
  end
end
