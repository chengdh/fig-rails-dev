#coding: utf-8
#特种设备
class SpecEquipment < ActiveRecord::Base
  belongs_to :org

  validates :ton,:volume,numericality: { greater_than_or_equal_to: 0}

  scope :next_check,->(org_ids){ransack(:last_check_date_lte => (365 - 60).days.ago.to_date).result.where(org_id: org_ids)}

  def equip_type_des
    ret = ""
    ret = "锅炉" if equip_type.eql?('boier')
    ret = "压力容器" if equip_type.eql?('container')
    ret = "起重设备" if equip_type.eql?('crane')
    ret = "电梯" if equip_type.eql?('elevator')
    ret
  end
  def next_check_date
    lcd = last_check_date
    lcd = Date.today if last_check_date.blank?
    lcd + 1.year
  end
end
