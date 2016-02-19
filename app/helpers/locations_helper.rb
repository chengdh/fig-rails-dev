#coding: utf-8
module LocationsHelper
  #只显示管辖架构的库位
  def current_ability_locations_for_select
    ret = []
    Warehouse.where(is_active: true,org_id: current_ability_org_ids).each do |w|
      ret += w.locations
    end
    ret.map {|l| [l.name,l.id]}
  end
end
