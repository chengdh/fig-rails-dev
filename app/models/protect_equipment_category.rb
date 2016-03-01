#coding: utf-8
#劳动防护用品分类
class ProtectEquipmentCategory < ActiveRecord::Base
  validates :name, presence: true
  def to_s ;name;end
end
