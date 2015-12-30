#coding: utf-8
#联赛大小球
class SeasonBall < ActiveRecord::Base
  self.table_name = "t_season_ball"
  self.primary_keys = :season_id, :team_id
  belongs_to :season
  belongs_to :team
  default_scope {order("ranking ASC")}
end
