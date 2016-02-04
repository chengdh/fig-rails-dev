#coding: utf-8
#赛季
class Season < ActiveRecord::Base
  self.table_name = "t_season"
  self.primary_key = "season_id"
  belongs_to :league
  has_many :schedules
  has_many :season_rankings
  has_many :season_goals
  has_many :season_balls
  has_many :season_archers
  has_many :stages
  has_many :cup_schedules
  has_many :cup_rankings
end
