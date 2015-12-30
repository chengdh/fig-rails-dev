#coding: utf-8
#联赛积分
class SeasonRanking < ActiveRecord::Base
  self.table_name = "t_season_ranking"
  self.primary_keys = :season_id, :team_id
  belongs_to :team
  belongs_to :season
  default_scope {order("ranking ASC")}
end
