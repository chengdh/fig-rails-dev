#coding: utf-8
#联赛射手榜
class SeasonArcher < ActiveRecord::Base
  self.table_name = "t_season_archer"
  belongs_to :team
  belongs_to :season
  default_scope {order("ranking ASC")}
end
