#coding: utf-8
module VehiclesHelper
  def current_ability_vehicles_for_select
    org_ids = current_ability_org_ids
    Vehicle.where(is_active: true,org_id: org_ids).map {|v| [v.vehicle_no,v.id]}
  end
end
