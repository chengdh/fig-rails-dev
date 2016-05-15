#coding: utf-8
#特种设备
class SpecEquipment < ActiveRecord::Base
  belongs_to :org

  validates :ton,:volume,numericality: { greater_than: 0}

  def equip_type_des
    ret = ""
    ret = "锅炉" if equip_type.eql?('boier')
    ret = "压力容器" if equip_type.eql?('container')
    ret = "起重设备" if equip_type.eql?('crane')
    ret
  end
end
