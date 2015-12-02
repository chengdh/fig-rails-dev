#coding: utf-8
#欧盘数据
class OddsEurope < ActiveRecord::Base
  self.table_name = "t_odds_europe"
  belongs_to :match
  belongs_to :company
end
