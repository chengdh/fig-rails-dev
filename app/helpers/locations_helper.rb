#coding: utf-8
module LocationsHelper
  #只显示管辖范围内的库位
  def current_ability_locations_for_select
    ret = []
    Warehouse.where(is_active: true,org_id: current_ability_org_ids).each do |w|
      ret += w.locations.where(location_type: Location::LOC_TYPE_NORMAL)
    end
    ret.map {|l| [l.name,l.id]}
  end

  def vendor_locations_for_select
    ret = []
    Warehouse.where(is_active: true,org_id: current_ability_org_ids).each do |w|
      ret += w.locations.where(location_type: Location::LOC_TYPE_VENDOR)
    end
    ret.map {|l| [l.name,l.id]}
  end
  def repair_locations_for_select
    ret = []
    Warehouse.where(is_active: true,org_id: current_ability_org_ids).each do |w|
      ret += w.locations.where(location_type: Location::LOC_TYPE_REPAIR)
    end
    ret.map {|l| [l.name,l.id]}
  end
  def worthless_locations_for_select
    ret = []
    Warehouse.where(is_active: true,org_id: current_ability_org_ids).each do |w|
      ret += w.locations.where(location_type: Location::LOC_TYPE_WORTHLESS)
    end
    ret.map {|l| [l.name,l.id]}
  end
  def employee_locations_for_select
    ret = []
   Warehouse.where(is_active: true,org_id: current_ability_org_ids).each do |w|
      ret += w.locations.where(location_type: Location::LOC_TYPE_EMPLOYEE)
    end
    ret.map {|l| [l.name,l.id]}
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
