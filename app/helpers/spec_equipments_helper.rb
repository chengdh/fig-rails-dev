#coding: utf-8
module SpecEquipmentsHelper
  def equip_types_for_select
    [["锅炉","boier"],["压力容器","container"],["起重设备","crane"]]
  end
  def equip_type_des(type_code)
    ret = ""
    ret = "锅炉" if type_code.eql?('boier')
    ret = "压力容器" if type_code.eql?('container')
    ret = "起重设备" if type_code.eql?('crane')
    ret = "电梯" if type_code.eql?('elevator')
  end
end
