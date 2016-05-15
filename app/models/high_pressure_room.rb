#coding: utf-8
#高压配电室
class HighPressureRoom < ElectricEquipment
  validates :area, numericality: { greater_than: 0}
end
