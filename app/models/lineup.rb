#coding: utf-8
#球队阵容
class Lineup < ActiveRecord::Base
  self.table_name = "t_lineup"
  self.primary_keys = :match_id, :team_id,:odds_type,:shirt_num
  belongs_to :match
  belongs_to :team
end
