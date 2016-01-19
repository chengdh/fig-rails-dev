#coding: utf-8
module OddChangesHelper
  def match_type_des(match_type)
    {
      1 => "临场",
      2 => "赛事中"
    }[match_type]
  end

  def change_type_des(change_type)
    {
      1 => "上升",
      2 => "下降"
    }[change_type]
  end
end
