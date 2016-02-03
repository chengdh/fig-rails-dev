#coding: utf-8
#亚盘数据
class OddsAsian < ActiveRecord::Base
  self.table_name = "t_odds_asian"
  self.primary_keys = :match_id, :company_id,:odds_type,:data_time
  default_scope {includes(:company).order("data_time DESC")}
  belongs_to :match
  belongs_to :company
end
