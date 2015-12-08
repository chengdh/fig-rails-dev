#coding: utf-8
#比赛事件
class Event < ActiveRecord::Base
  belongs_to :match
  self.table_name = "t_event"
end
