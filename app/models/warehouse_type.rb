#coding: utf-8
#仓库类型
class WarehouseType < ActiveRecord::Base
  validates :name, presence: true
  default_scope {order("order_by ASC")}
  #信息设备仓库
  #固定资产仓库
  #易耗品仓库
  #无形资产仓库
  WH_TYPE_IT = "warehouse_type_it"
  WH_TYPE_ASSET = "warehouse_type_asset"
  WH_TYPE_CONSUME = "warehouse_type_consume"
  WH_TYPE_VIRTUAL = "warehouse_type_virtual"
end
