#coding: utf-8
class Transformer < ElectricEquipment
  validates :power, numericality: { greater_than_or_equal_to: 0}
  def work_type_des
    ret = ""
    ret = "干式" if work_type.eql?("dry")
    ret = "湿式" if work_type.eql?("wet")
    ret
  end
end
