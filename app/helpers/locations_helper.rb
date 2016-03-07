#coding: utf-8
module LocationsHelper
  #只显示管辖范围内的库位
  def current_ability_locations_for_select
    ret = []
    Warehouse.where(is_active: true,org_id: current_ability_org_ids).each do |w|
      ret += w.locations
    end
    ret.map {|l| [l.name,l.id]}
  end

  def location_types_for_select
    [["普通库位","normal_loc"],["供货商库位","vendor_loc"],["维修库位","repair_loc"],["报废库位","worthless_loc"]]
  end
end
