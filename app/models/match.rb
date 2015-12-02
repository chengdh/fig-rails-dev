#coding: utf-8
#比赛
class Match < ActiveRecord::Base
  self.table_name = "t_match"
  self.primary_key = "match_id"
  belongs_to :league
  belongs_to :team1,class_name: "Team"
  belongs_to :team2,class_name: "Team"
  has_many :odds_asians
  has_many :odds_europes
  has_many :odds_balls
  has_many :odds_events
  has_many :current_matches
  has_many :line_ups

  #亚盘初盘
  def begin
    odds_asians.where(odds_type: 1).try(:first).try(:home)
  end
  def current
    odds_asians.where(odds_type: 2).try(:first).try(:home)
  end
  def final
    odds_asians.where(odds_type: 3).try(:first).try(:home)
  end
end
