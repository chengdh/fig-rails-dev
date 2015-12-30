#coding: utf-8
#杯赛积分
class CupRanking < ActiveRecord::Base
  self.table_name = "t_cup_ranking"
  self.primary_keys = :season_id, :team_id,:group_no
  belongs_to :team
  belongs_to :season
end
