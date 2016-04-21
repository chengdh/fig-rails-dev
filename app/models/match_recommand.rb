#coding: utf-8
#比赛推荐
class MatchRecommand < ActiveRecord::Base
  self.table_name = "t_match_recommend"
  self.primary_keys = :match_id,:team_id,:recommend_type
  belongs_to :match
  belongs_to :team
  default_scope {includes(:team,:match).order("t_match.match_time DESC")}

  scope :unread,->(data_time) {where("TO_CHAR(t_match_recommend.data_time,'YYYY-MM-DD HH24:MI') > ? ",data_time)}
  #最近胜场
  scope :recent_win,-> {where("t_match_recommend.result_type > 0 AND t_match_recommend.recommend_type = 1 ").limit(10)}
end
