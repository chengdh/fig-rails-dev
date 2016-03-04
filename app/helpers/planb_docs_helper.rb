#coding: utf-8
module PlanbDocsHelper
  def plan_types_for_select
    [["现场演练","act"],["桌面演练","sim"]]
  end
  def audit_item_state_des(b_state)
    ret = ""
    ret = "符合" if b_state
    ret = "不符合" unless b_state
    ret
  end
end
