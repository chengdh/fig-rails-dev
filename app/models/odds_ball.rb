#coding: utf-8
#大小球数据
class OddsBall < ActiveRecord::Base
  self.table_name = "t_odds_ball"
  self.primary_keys = :match_id, :company_id,:odds_type,:data_time
  belongs_to :match
  belongs_to :company
end
