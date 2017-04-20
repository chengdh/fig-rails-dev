#coding: utf-8
module SpecWarehousesHelper
  def spec_warehouse_types_for_select
    [["卷烟物流中心仓库","center_warehouse"],["烟叶存储仓库(含烟站)","station_warehouse"]]
  end
  def spec_warehouse_type_des(type_code)
    ret = ""
    ret = "卷烟物流中心仓库" if type_code.eql?('center_warehouse')
    ret = "烟叶存储仓库(含烟站)" if type_code.eql?('station_warehouse')
    ret
  end

  def fire_levels_for_select
    [["1级",1],["2级",2],["3级",3],["4级",4]]
  end
end
