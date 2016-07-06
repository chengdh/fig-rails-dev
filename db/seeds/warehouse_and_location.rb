Warehouse.destroy_all
#每个机构一个仓库
Org.all.each do |o|
  WarehouseType.all.each do |wt|
    Warehouse.create!(name: "#{o.name}>#{wt.name}",org_id: o.id,warehouse_type: wt)
  end
end

Location.destroy_all
#每个仓库一个库位
Warehouse.all.each do |w|
  Location.create!(name: "#{w.name}>库存",warehouse: w,location_type: Location::LOC_TYPE_NORMAL)
  Location.create!(name: "#{w.name}>供应商库位",warehouse: w,location_type: Location::LOC_TYPE_VENDOR)
  Location.create!(name: "#{w.name}>维修库位",warehouse: w,location_type: Location::LOC_TYPE_REPAIR)
  Location.create!(name: "#{w.name}>领用库位",warehouse: w,location_type: Location::LOC_TYPE_EMPLOYEE)
  Location.create!(name: "#{w.name}>报废库位",warehouse: w,location_type: Location::LOC_TYPE_WORTHLESS)
end

