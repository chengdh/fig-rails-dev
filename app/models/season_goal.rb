#coding: utf-8
#联赛让球
class SeasonGoal < ActiveRecord::Base
  self.table_name = "t_season_goal"
  self.primary_keys = :season_id, :team_id
  belongs_to :season
  belongs_to :team
  default_scope {order("ranking ASC")}
end
