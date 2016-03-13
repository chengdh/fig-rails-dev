#coding: utf-8
module EquipmentHelper
  def equipment_for_select
    Equipment.where(is_active: true).map {|e| [e.name,e.id]}
  end
end
