#coding: utf-8
module ApplicationHelper
  #当日的前一天向前推7天
  def last_week_for_select
    (7.days.ago.to_datetime...Date.today.to_datetime).map {|d| [d.strftime("%Y年%m月%d日")+"星期#{get_wday_cn(d.wday)}",d.strftime("%Y-%m-%d")]}
  end
  #获取星期的中文显示
  def get_wday_cn(wday_num)
    ret = ""
    ret = "日" if wday_num.eql?(0)
    ret = "一" if wday_num.eql?(1)
    ret = "二" if wday_num.eql?(2)
    ret = "三" if wday_num.eql?(3)
    ret = "四" if wday_num.eql?(4)
    ret = "五" if wday_num.eql?(5)
    ret = "六" if wday_num.eql?(6)
    ret
  end

  #今日向后推7天
  def this_week_for_select
    (Date.today.to_datetime...6.days.since.to_datetime).map {|d| [d.strftime("%Y年%m月%d日")+"星期#{get_wday_cn(d.wday)}",d.strftime("%Y-%m-%d")]}
  end

  #将类似与1.0 2.0 这种数组转换为整数
  def dec2int(dec)
    return "" if dec.blank?
    dec == dec.to_i ? dec.to_i : dec
  end
  def thirty_days_ago_for_select
    (30.days.ago.to_datetime...Date.today.to_datetime).map {|d| [d.strftime("%Y年%m月%d日")+"星期#{get_wday_cn(d.wday)}",d.strftime("%Y-%m-%d")]}
  end
end
