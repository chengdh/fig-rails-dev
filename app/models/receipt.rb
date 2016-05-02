#coding: utf-8
#收货入库单
class Receipt < InoutBill
  # #固定资产 it设备 入库时,编号不允许为空及重复
  # validates :no,presence: true,uniqueness: true, length: { maximum: 20 },allow_nil: true
  #
  # validate :check_line_no
  # def check_line_no
  #   inout_lines.each do  |l|
  #     errors.add("equip_#{l.equipment_id}","编号不可为空!") if l.no.blank?
  #   end
  # end
end
