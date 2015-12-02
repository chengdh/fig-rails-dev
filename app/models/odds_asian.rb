#coding: utf-8
#亚盘数据
class OddsAsian < ActiveRecord::Base
  self.table_name = "t_odds_asian"
  belongs_to :match
  belongs_to :company
end
