#coding: utf-8
#比赛事件
class Event < ActiveRecord::Base
  self.table_name = "t_event"
  belongs_to :match
  default_scope {order("data_time DESC")}
  scope :unread,->(data_time) {where("TO_CHAR(data_time,'YYYY-MM-DD HH24:MI') > ? ",data_time)}
end
