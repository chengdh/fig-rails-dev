#coding: utf-8
#联赛赛程
class Schedule < ActiveRecord::Base
  self.table_name = "t_schedule"
  belongs_to :season
  belongs_to :match
end
