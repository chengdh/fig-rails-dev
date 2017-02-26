#coding: utf-8
class CuxDemand < ActiveRecord::Base
  self.table_name = "cux_demand_platform_headers_a"
  has_many :cux_demand_lines
  scope :bills_by_wf_itemkeys,-> (wf_itemkeys) {where(wf_itemkey: wf_itemkeys).includes(:cux_demand_lines)}

  def self.unread_bills(wf_itemkeys)
    self.bills_by_wf_itemkeys(wf_itemkeys).to_json(include: :cux_demand_lines)
  end

  def self.audit(user_id,username,notification_id,b_pass,audit_note)
    ret = plsql.CUX_MOBILE_APP_PVT.GENERAL_APPROVAL(user_id,
                                                    username,
                                                    notification_id,
                                                    b_pass,
                                                    audit_note,
                                                    user_id)
    #{x_ret_code: ret[:x_ret_code],x_ret_message: ret[:x_ret_message]}
    # {x_ret_code: '0',x_ret_message: 'success'}
    # ret = plsql.CUX_MOBILE_APP_PVT.GENERAL_APPROVAL(1376,
    #                                                 '10018935',
    #                                                 4124942,
    #                                                 '0',
    #                                                 'c',
    #                                                 1376)
    #
    # ret
    # cursor = ActiveRecord::Base.connection.raw_connection.parse("BEGIN CUX_MOBILE_APP_PVT.GENERAL_APPROVAL(:p_user_id, :p_username, :p_notification_id,:p_app_result_code,:p_app_result_note,:x_login_id,:x_ret_code,:x_ret_message); END;")
    # cursor.bind_param(':p_user_id', user_id)
    # cursor.bind_param(':p_username', username)
    # cursor.bind_param(':p_notification_id', notification_id)
    # cursor.bind_param(':p_app_result_code', b_pass)
    # cursor.bind_param(':p_app_result_note', audit_note)
    #
    # cursor.bind_param(':x_login_id', user_id)
    # cursor.bind_param(':x_ret_code', nil,String)
    # cursor.bind_param(':x_ret_message', nil,String)
    # cursor.bind_param(1, 0)
    # cursor.bind_param(2, nil,String)
    # cursor.bind_param(3, 46973)
    # cursor.bind_param(4, "0")
    # cursor.bind_param(5, "test")
    #
    # cursor.bind_param(6, 0)
    # cursor.bind_param(7, nil,String)
    # cursor.bind_param(8, nil,String)
    # cursor.bind_param(1, user_id)
    # cursor.bind_param(2, username)
    # cursor.bind_param(3, notification_id)
    # cursor.bind_param(4, b_pass)
    # cursor.bind_param(5, audit_note)
    #
    # cursor.bind_param(6, user_id)
    # cursor.bind_param(7, nil,String,10)
    # cursor.bind_param(8, nil,String,1000)

    # cursor.exec()
    {x_ret_code: ret[:x_ret_code],x_ret_message: ret[:x_ret_message]}
  end
end
