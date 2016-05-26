#coding: utf-8
class LowPressureRoom < ElectricEquipment
  validates :area, numericality: { greater_than_or_equal_to: 0}
end
