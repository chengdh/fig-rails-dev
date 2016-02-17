#coding: utf-8
#设备类别
class EquipmentCategory < ActiveRecord::Base
  belongs_to :org
  validates :name, presence: true
  default_scope {order("order_by ASC")}

  def to_s
    name
  end
end
