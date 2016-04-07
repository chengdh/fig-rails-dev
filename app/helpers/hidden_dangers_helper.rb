#coding: utf-8
module HiddenDangersHelper
  def fix_periods_for_select
    [["15日",15],["1个月",30],["3个月",90],["6个月",180]]
  end
  #延期时段选择
  def postponement_periods_for_select
    [["7天",7]]
  end

  def fix_states_for_select
    [["草稿(未处理)","draft"],
     ["待整改","deliveried"],
     ["处理中","processing"],
     ["待复查","fixed"],
     ["整改完成","revicew_ok"]
    ]
  end
  def review_states_for_select
    [
     ["合格","review_ok"],
     ["不合格","review_reject"]
    ]
  end

end
