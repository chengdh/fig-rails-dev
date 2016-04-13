#coding: utf-8
module ModelStateMachine
  #提交
  def submit(attrs)
    update_attributes(attrs.merge!(check_state: "submitted",submit_date: Date.today))
  end
  #审批
  def check(attrs)
    update_attributes(attrs.merge!(check_date: Date.today))
  end
  #状态
  def check_state_des
    ret = ""
    ret = "草稿(未审批)" if check_state.eql?("draft")
    ret = "待审核" if check_state.eql?("submitted")
    ret = "通过" if check_state.eql?("confirmed")
    ret = "不通过" if check_state.eql?("rejected")
    ret
  end
end
