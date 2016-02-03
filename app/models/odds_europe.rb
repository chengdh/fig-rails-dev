#coding: utf-8
#欧盘数据
class OddsEurope < ActiveRecord::Base
  self.table_name = "t_odds_europe"
  default_scope {includes(:company).order("data_time DESC")}
  belongs_to :match
  belongs_to :company
end
