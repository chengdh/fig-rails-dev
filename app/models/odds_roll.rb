#coding: utf-8
#滚球数据
class OddsRoll < ActiveRecord::Base
  self.table_name = "t_odds_roll"
  self.primary_keys = :match_id,:company_id,:data_time
  default_scope {order("data_time DESC")}
  belongs_to :company
  belongs_to :match
end
