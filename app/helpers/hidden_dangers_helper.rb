#coding: utf-8
module HiddenDangersHelper
  def fix_periods_for_select
    [["15日",15],["1个月",30],["3个月",90],["6个月",180]]
  end
  def fix_states_for_select
    [["草稿(未处理)","draft"],
     ["已下发","deliveried"],
     ["处理中","processing"],
     ["整改完成","fixed"]]
  end
end
