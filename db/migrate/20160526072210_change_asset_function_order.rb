#coding: utf-8
class ChangeAssetFunctionOrder < ActiveRecord::Migration
  def change
    old_functions = %w(固定资产资料 固定资产-采购单 固定资产入库单 固定资产-出库单 固定资产-调拨单 固定资产-维修单 固定资产-报废单 固定资产-领用单 固定资产-库存统计)
    new_functions = %w(固定资产-资料 固定资产-采购单 固定资产-入库单 固定资产-出库单 固定资产-调拨单 固定资产-维修单 固定资产-报废单 固定资产-领用单 固定资产-库存统计)
    old_functions.each_with_index do |name,i|
      sf = SystemFunction.find_by(name: name)
      sf.update_attributes(name: new_functions[i],order_by: i) if sf.present?
    end
  end
end
