#coding: utf-8
class Team < ActiveRecord::Base
  self.table_name = "t_team"
  self.primary_key = "team_id"
  has_many :match_recommands
end
