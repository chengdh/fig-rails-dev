#coding: utf-8
#联赛信息
class League < ActiveRecord::Base
  self.table_name = "t_league"
  self.primary_key = "league_id"
  default_scope -> {order(:country_id)}
  belongs_to :country
  has_many :seasons
  has_many :stages

  has_many :schedules,through: :seasons
  has_many :cup_schedules,through: :seasons
  has_many :cup_rankings,through: :seasons
  has_many :season_rankings,through: :seasons
  has_many :season_goals,through: :seasons
  has_many :season_balls,through: :seasons
  has_many :season_archers,through: :seasons

end
