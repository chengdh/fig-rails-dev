#coding: utf-8
class MatchRecommendTmp < ActiveRecord::Base
  self.table_name = "t_match_recommend_temp"
  self.primary_keys = :match_id,:team_id,:recommend_type
  belongs_to :match
  default_scope {includes(:team).order("data_time DESC")}

  scope :unread,->(data_time) {where("TO_CHAR(data_time,'YYYY-MM-DD HH24:MI') > ? ",data_time)}
end
