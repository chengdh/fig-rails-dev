#coding: utf-8
module ElectricEquipmentsHelper
  def electric_equipment_types_for_select
    ElectricEquipment.types.map {|k,v| [v,k]}
  end

  def equip_levels_for_select
    [["1级",1],["2级",2],["3级",3],["4级",4]]
  end

  def work_types_for_select
    [["干式","dry"],["湿式","wet"]]
  end
  def work_type_desc(code)
    ret = ""
    ret = "干式" if code.eql?("dry")
    ret = "湿式" if code.eql?("wet")
    ret
  end
end
