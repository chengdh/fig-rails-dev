#coding: utf-8
class DistributeBox < ElectricEquipment
  validates :qty, numericality: { only_integer: true,greater_than: 0}
  validates :volume, numericality: { only_integer: true,greater_than: 0}
end
