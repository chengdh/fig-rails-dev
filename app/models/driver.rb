#coding: utf-8
class Driver < ActiveRecord::Base
  validates :org_id,:name, presence: true
  belongs_to :org
  belongs_to :vehicle
  default_scope {order("org_id")}

  scope :next_check,->(org_ids){ransack(:next_check_date_lteq => 60.days.ago.to_date).result.where(org_id: org_ids)}
end
