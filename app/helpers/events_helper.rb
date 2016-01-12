#coding: utf-8
module EventsHelper
  #得到event_type的中文描述
  #事件类型1、进球； 3、黄牌；7、点球；8、乌龙；9、红牌；11、换人
  def event_type_des(evt_type_id)
    {
      1 => "进球",
      3 => "黄牌",
      7 => "点球",
      8 => "乌龙",
      9 => "红牌",
      11 => "换人"
    }[evt_type_id]

  end
end
