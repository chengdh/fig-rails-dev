#coding: utf-8
#亚欧赔率统计
class OddsRate < ActiveRecord::Base
  self.table_name = "t_odds_rates"
  self.primary_keys = :match_id, :company_id,:odds_type
  belongs_to :match
  belongs_to :company
end
