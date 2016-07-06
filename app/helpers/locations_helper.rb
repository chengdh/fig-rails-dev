#coding: utf-8
module LocationsHelper
  def locations_for_select(wh_type = WarehouseType::WH_TYPE_IT,loc_type = Location::LOC_TYPE_NORMAL)
    ret = []
    wh_type_id = WarehouseType.find_by(code: wh_type).id
    wh_ids = Warehouse.where(is_active: true,org_id: current_ability_org_ids,warehouse_type_id: wh_type_id ).pluck(:id)
    ret = Location.where(warehouse_id: wh_ids,location_type: loc_type)
    ret.map {|l| [l.name,l.id]}
  end

  #库存查询-库位列表(包括库存库位  领用库位 维修库位 报废库位)
  def locations_select_for_stock(wh_type = WarehouseType::WH_TYPE_IT)
    ret = current_ability_locations_for_select(wh_type) +
      employee_locations_for_select(wh_type) +
      repair_locations_for_select(wh_type) +
      worthless_locations_for_select(wh_type)
  end

  #只显示管辖范围内的库位
  def current_ability_locations_for_select(wh_type = WarehouseType::WH_TYPE_IT)
    locations_for_select(wh_type,Location::LOC_TYPE_NORMAL)
  end

  def vendor_locations_for_select(wh_type = WarehouseType::WH_TYPE_IT)
    locations_for_select(wh_type,Location::LOC_TYPE_VENDOR)
  end
  def repair_locations_for_select(wh_type = WarehouseType::WH_TYPE_IT)
    locations_for_select(wh_type,Location::LOC_TYPE_REPAIR)
  end
  def worthless_locations_for_select(wh_type = WarehouseType::WH_TYPE_IT)
    locations_for_select(wh_type,Location::LOC_TYPE_WORTHLESS)
  end
  def employee_locations_for_select(wh_type = WarehouseType::WH_TYPE_IT)
    locations_for_select(wh_type,Location::LOC_TYPE_EMPLOYEE)
  end

  def location_types_for_select
    [
      ["普通库位",Location::LOC_TYPE_NORMAL],
      ["供货商库位",Location::LOC_TYPE_VENDOR],
      ["维修库位",Location::LOC_TYPE_REPAIR],
      ["报废库位",Location::LOC_TYPE_WORTHLESS],
      ["领用库位",Location::LOC_TYPE_EMPLOYEE]
    ]
  end
end
