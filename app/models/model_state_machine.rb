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
  #根据fixed_state获取在前端显示的颜色
  #待整改 -- 黄色
  #待复查 -- 蓝色
  #整改合格 -- 绿色
  #整个不合格 -- 红色
  def check_state_class
    css = ""
    css = "label label-warning" if ["submitted"].include?(check_state)
    css = "label label-draft" if ["draft"].include?(check_state)
    css = "label label-success" if ["confirmed"].include?(check_state)
    css = "label label-danger" if check_state.eql?("rejected")
    css
  end

end
