#coding: utf-8
#劳动防护用品分类
class ProtectEquipmentCategory < ActiveRecord::Base
  validates :name, presence: true
  default_scope {order("order_by ASC")}
  def to_s ;name;end
end
