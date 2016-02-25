#coding: utf-8
#盘口数据变化
class OddChange < ActiveRecord::Base
  self.table_name = "t_odds_change"
  belongs_to :team
  belongs_to :match
  #默认显示最近5条
  default_scope {order("data_time DESC")}

  scope :unread,->(data_time) {where("TO_CHAR(data_time,'YYYY-MM-DD HH24:MI') > ? ",data_time)}
end
