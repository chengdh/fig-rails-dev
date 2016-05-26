#coding: utf-8
class DistributeBox < ElectricEquipment
  validates :qty, numericality: { greater_than_or_equal_to: 0}
  validates :volume, numericality: { greater_than_or_equal_to: 0}
end
