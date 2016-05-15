#coding: utf-8
class Transformer < ElectricEquipment
  validates :power, numericality: { greater_than: 0}
end
