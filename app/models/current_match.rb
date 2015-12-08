#coding: utf-8
#即时比赛信息
class CurrentMatch < ActiveRecord::Base
  self.table_name = "t_current_match"
  self.primary_key = "match_id"
  belongs_to :match
end
