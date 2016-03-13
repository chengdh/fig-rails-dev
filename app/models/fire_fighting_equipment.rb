#coding: utf-8
#消防设施
class FireFightingEquipment < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  validates :name,:org_id, presence: true
  default_scope {order("org_id DESC")}

  #过期设备
  scope :expired,->(org_ids){ransack(:valid_date_gte => 10.days.ago.to_date).result.where(org_id: org_ids)}
end
