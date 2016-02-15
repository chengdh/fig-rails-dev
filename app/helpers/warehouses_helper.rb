#coding: utf-8
module WarehousesHelper
  #当前可用的仓库列表
  def current_ability_warehouse_for_select
    default_org_id = current_user.current_org.id
    ret = ActiveSupport::OrderedHash.new
    children_ids = current_user.current_org.children.map {|org|  org.id}
    Warehouse.where(is_active: true,org_id: [default_org_id] + children_ids).map {|w| [w.name,w.id]}
  end
end
