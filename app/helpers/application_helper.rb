#coding: utf-8
module ApplicationHelper
  #当日的前一天向前推7天
  def last_week_for_select
    (7.days.ago.to_datetime...Date.today.to_datetime).map {|d| [d.strftime("%Y年%m月%d日")+"星期#{d.wday}",d.strftime("%Y-%m-%d")]}
  end

  #今日向后推7天
  def this_week_for_select
    (Date.today.to_datetime...6.days.since.to_datetime).map {|d| [d.strftime("%Y年%m月%d日")+"星期#{d.wday}",d.strftime("%Y-%m-%d")]}
  end
end
