#coding: utf-8
#事故月报主表
class AccidentHeader < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  has_many :accidents
  validates :org_id,:mth,:table_date, presence: true
  accepts_nested_attributes_for :accidents
  default_scope {order("mth DESC,org_id ASC")}
  default_value_for :table_date do
    Date.today
  end
  default_value_for :mth do
    1.month.ago.strftime("%Y%m")
  end
end
