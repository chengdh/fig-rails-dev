#coding: utf-8
module WarehouseTypesHelper
  def warehouse_types_for_select
    WarehouseType.where(is_active: true).map {|wt| [wt.name,wt.id]}
  end
end
