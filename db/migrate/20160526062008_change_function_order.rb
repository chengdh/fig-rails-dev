#coding: utf-8
#调整菜单排序
class ChangeFunctionOrder < ActiveRecord::Migration
  def up
    #信息-信息设备管理 --> 备品备件管理
    sfg = SystemFunctionGroup.find_by(name: "信息-信息设备管理")
    sfg.update_attributes(name: "信息-备品备件管理") if sfg.present?
    old_functions = %w(信息设备资料 信息设备-采购单 设备入库单 设备出库单 设备维修出库 设备报废单 设备领用单 设备调拨 信息设备-库存统计)
    new_functions = %w(备品备件-资料 备品备件-采购单 备品备件-入库单 备品备件-出库单 备品备件-维修出库 备品备件-报废单  备品备件-调拨单 备品备件-领用单 备品备件-库存统计)
    old_functions.each_with_index do |name,i|
      sf = SystemFunction.find_by(name: name)
      sf.update_attributes(name: new_functions[i],order_by: i) if sf.present?
    end
  end
  def down ; end
end
