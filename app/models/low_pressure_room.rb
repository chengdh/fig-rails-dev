#coding: utf-8
class LowPressureRoom < ElectricEquipment
  validates :area, numericality: { greater_than: 0}
end
