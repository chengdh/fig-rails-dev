#coding: utf-8
#球队阵容
class Lineup < ActiveRecord::Base
  self.table_name = "t_lineup"
  belongs_to :match
  belongs_to :team
end
