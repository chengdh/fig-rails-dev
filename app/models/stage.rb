#coding: utf-8
#杯赛阶段
class Stage < ActiveRecord::Base
  self.table_name = "t_stage"
  self.primary_key = "stage_id"
  belongs_to :league
  belongs_to :season
  has_many :cup_rankings
  has_many :cup_schedules
end
