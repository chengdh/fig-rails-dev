#coding: utf-8
#修改菜单分类
class ChangeSystemFunctionGroup < ActiveRecord::Migration
  def change
    #任务管理修改为 信息-任务管理
    sfg = SystemFunctionGroup.find_by(name: "任务管理")
    sfg.update_attributes(name: "信息-任务管理",order_by: 2100) if sfg.present?

    #设备管理中的数据字典
    sfg_dict = SystemFunctionGroup.find_or_create_by(name: "信息-数据字典")
    sfg_dict.update_attributes(order_by: 2000) if sfg_dict.present?

    sf_1 = SystemFunction.find_by(name: "设备分类")
    sf_1.update_attributes(system_function_group_id: sfg_dict.id) if sf_1

    sf_2 = SystemFunction.find_by(name: "计量单位")
    sf_2.update_attributes(system_function_group_id: sfg_dict.id) if sf_2

    sf_3 = SystemFunction.find_by(name: "仓库分类")
    sf_3.update_attributes(system_function_group_id: sfg_dict.id) if sf_3

    sf_4 = SystemFunction.find_by(name: "仓库设置")
    sf_4.update_attributes(system_function_group_id: sfg_dict.id) if sf_4

    sf_5 = SystemFunction.find_by(name: "库位设置")
    sf_5.update_attributes(system_function_group_id: sfg_dict.id) if sf_5

    sfg_it = SystemFunctionGroup.find_by(name: "信息-信息设备管理")
    sfg_it.update_attributes(order_by: 2200) if sfg_it.present?
    
    sf_6 = SystemFunction.find_by(name: "设备调拨")
    sf_6.update_attributes(system_function_group_id: sfg_it.id) if sf_6

    
    sf_7 = SystemFunction.find_by(name: "设备采购入库")
    sf_7.update_attributes(name: "设备入库单",system_function_group_id: sfg_it.id) if sf_7

    sf_8 = SystemFunction.find_by(name: "设备出库单")
    sf_8.update_attributes(system_function_group_id: sfg_it.id) if sf_8

    sf_9 = SystemFunction.find_by(name: "设备维修出库")
    sf_9.update_attributes(system_function_group_id: sfg_it.id) if sf_9


    sf_10 = SystemFunction.find_by(name: "设备报废单")
    sf_10.update_attributes(system_function_group_id: sfg_it.id) if sf_10

    sf_11 = SystemFunction.find_by(name: "设备领用单")
    sf_11.update_attributes(system_function_group_id: sfg_it.id) if sf_11

    sf_12 = SystemFunction.find_by(name: "库存统计")
    sf_12.update_attributes(name: "信息设备-库存统计",system_function_group_id: sfg_it.id) if sf_12

    sfg_asset = SystemFunctionGroup.find_by(name: "信息-固定资产管理")
    sfg_asset.update_attributes(order_by: 2300) if sfg_asset.present?
    
    sfg_consume = SystemFunctionGroup.find_by(name: "信息-易耗品管理")
    sfg_consume.update_attributes(order_by: 2400) if sfg_consume.present?
    
    sfg_virtual = SystemFunctionGroup.find_by(name: "信息-无形资产管理")
    sfg_virtual.update_attributes(order_by: 2500) if sfg_virtual.present?

    sfg_website = SystemFunctionGroup.find_by(name: "网站后台管理")
    sfg_website.update_attributes(order_by:  2600) if sfg_website.present?

    #删除设备管理
    # sf_equipment = SystemFunction.find_by(name: "设备资料")
    # sf_equipment.destroy! if sf_equipment.present?
    sfg_equipment = SystemFunctionGroup.find_by(name: "设备管理")
    sfg_equipment.update_attributes(is_active:  false) if sfg_equipment.present?

    sfg_ab = SystemFunctionGroup.find_by(name: "安保-基础信息管理")
    sfg_ab.update_attributes(order_by:  8000) if sfg_ab.present?

    sfg_ab_2 = SystemFunctionGroup.find_by(name: "安保-动态情况管理")
    sfg_ab_2.update_attributes(order_by:  8100) if sfg_ab_2.present?

    sfg_ab_3 = SystemFunctionGroup.find_by(name: "安保-考评管理")
    sfg_ab_3.update_attributes(order_by:  8200) if sfg_ab_3.present?

  end
end
