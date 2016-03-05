#coding: utf-8
module HiddenDangersHelper
  def fix_periods_for_select
    [["15日",15],["1个月",30],["3个月",90],["6个月",180]]
  end
end
