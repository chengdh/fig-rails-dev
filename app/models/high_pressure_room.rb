#coding: utf-8
#高压配电室
class HighPressureRoom < ElectricEquipment
  validates :area, numericality: { greater_than_or_equal_to: 0}
end
