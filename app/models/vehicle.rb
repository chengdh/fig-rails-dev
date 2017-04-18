#coding: utf-8
#交通工具信息
class Vehicle < ActiveRecord::Base
  belongs_to :org
  validates :org_id,:vehicle_no,:register_no,:license_no, presence: true
  default_scope {order("org_id DESC")}

  scope :next_check,->(org_ids){ransack(:last_check_date_lteq => (365 - 60).days.ago.to_date).result.where(org_id: org_ids)}
  def to_s
    vehicle_no
  end
  def next_check_date
    lcd = last_check_date
    lcd = Date.today if last_check_date.blank?
    lcd + 1.year
  end
end
