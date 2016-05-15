#coding: utf-8
#消防设施
class FireFightingEquipment < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  belongs_to :unit
  validates :name,:org_id, presence: true
  validates :qty, numericality: { only_integer: true,greater_than: 0}
  default_scope {order("org_id DESC")}

  #过期设备
  #scope :expired,->(org_ids){ransack(:valid_date_gte => 10.days.ago.to_date).result.where(org_id: org_ids)}
  scope :expired,->(org_ids){order(:created_at)}
end
