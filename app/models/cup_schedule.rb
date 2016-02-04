#coding: utf-8
#杯赛赛程
class CupSchedule < ActiveRecord::Base
  self.table_name = "t_cup_schedule"
  belongs_to :season
  belongs_to :stage
  belongs_to :team
  belongs_to :match
end
