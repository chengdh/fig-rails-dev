#coding: utf-8
#消防设施
class FireFightingEquipment < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  belongs_to :unit
  validates :name,:org_id, presence: true
  validates :qty, numericality: { only_integer: true,greater_than: 0}
  default_scope {order("org_id DESC")}

  #等待年检设备,提前60天提醒
  scope :next_check,->(org_ids){ransack(:last_upkeep_date_lteq => (365 - 60).days.ago.to_date).result.where(org_id: org_ids)}

  #接近报废数据
  scope :valid_date_alarms,->(org_ids){ransack(:valid_date_lteq => 60.days.since.to_date).result.where(org_id: org_ids)}


  scope :expired,->(org_ids){ransack(:last_upkeep_date_gte => 10.days.ago.to_date).result.where(org_id: org_ids)}
  def next_check_date
    lcd = last_upkeep_date
    lcd = Date.today if last_upkeep_date.blank?
    lcd + 1.year
  end
end
