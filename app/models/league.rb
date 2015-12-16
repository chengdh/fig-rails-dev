#coding: utf-8
#联赛信息
class League < ActiveRecord::Base
  self.table_name = "t_league"
  self.primary_key = "league_id"
  default_scope -> {order(:country_id)}
  belongs_to :country,foreign_key: :country_id
end
