#coding: utf-8
#比赛推荐
class MatchRecommand < ActiveRecord::Base
  self.table_name = "t_match_recommend"
  self.primary_keys = :match_id,:team_id,:recommend_type
  belongs_to :match
  belongs_to :team
end
