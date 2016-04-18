#coding: utf-8
#比赛推荐
class MatchRecommand < ActiveRecord::Base
  self.table_name = "t_match_recommend"
  self.primary_keys = :match_id,:team_id,:recommend_type
  belongs_to :match
  belongs_to :team
  default_scope {includes(:team).order("data_time DESC")}

  scope :unread,->(data_time) {where("TO_CHAR(data_time,'YYYY-MM-DD HH24:MI') > ? ",data_time)}
end