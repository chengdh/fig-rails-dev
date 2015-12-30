#coding: utf-8
#比赛事件
class Event < ActiveRecord::Base
  self.table_name = "t_event"
  belongs_to :match
  default_scope {order("happen_time ASC")}
end
