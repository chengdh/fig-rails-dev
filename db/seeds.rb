# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Unit.destroy_all
WarehouseType.destroy_all
EquipmentCategory.destroy_all
Employee.destroy_all
User.destroy_all
Role.destroy_all
Org.destroy_all

root_org = Org.create(name: "南阳市烟草专卖局",address: "河南省南阳市滨河东路1968号",phone: "0377-63588719",email: "nyycbgs@126.com")
child_orgs = %w(邓州市烟草专卖局 桐柏县烟草专卖局 方城县烟草专卖局
淅川县烟草专卖局 镇平县烟草专卖局 唐河县烟草专卖局
南召县烟草专卖局 内乡县烟草专卖局 新野县烟草专卖局
社旗县烟草专卖局 西峡县烟草专卖局 卧龙区烟草专卖局
宛城区烟草专卖局 市局信息处 市局安检处)
child_orgs.each do |o|
  Org.create!(name: o,parent: root_org)
end

#角色设置
admin_role = Role.new(name: "管理员",order_by: 1)
admin_role.save
SystemFunctionOperate.all.each do |sfo|
  admin_role.role_system_function_operates << RoleSystemFunctionOperate.new(system_function_operate: sfo,is_select: true)
end
admin_role.save!

user_role = Role.new(name: "普通用户",order_by: 2)
user_role.save
SystemFunctionOperate.all.each do |sfo|
  user_role.role_system_function_operates << RoleSystemFunctionOperate.new(system_function_operate: sfo,is_select: true)
end
user_role.save!

#用户信息设置
admin = User.new(username: "admin",is_admin: true,real_name: "管理员",password: "12345678",email: "admin@a.com")
admin.roles << admin_role
Org.where(is_active: true).each do |o|
  admin.orgs << o
end
admin.save!

user = User.new(username: "user",is_admin: false,real_name: "普通用户",password: "12345678",email: "user@a.com")
user.roles << user_role
Org.where(is_active: true).each do |o|
  user.orgs << o
end

user.save!

#150个员工数据
(1..150).each do |i|
  Employee.create!(name: "员工_#{i}",org: Org.first,email: "a_#{i}@b.com")
end

#设备分类
categs = %w(台式机 笔记本 耗材 数码相机 其他)
categs.each do |c|
  EquipmentCategory.create!(name: c)
end

#计量单位
units = %w(个 件 台 量 张 本)
units.each do |u|
  Unit.create!(name: u)
end

warehouse_types = %w(设备仓库 固定资产库 低值易耗品库 无形资产库)
warehouse_codes = %w(warehouse_type_it warehouse_type_asset warehouse_type_consume warehouse_type_virtual)
warehouse_types.each_with_index do |wt,i|
  WarehouseType.create!(name: wt,code: warehouse_codes[i])
end

Warehouse.destroy_all
#每个机构一个仓库
Org.all.each do |o|
  Warehouse.create!(name: "#{o.name}_仓库",org_id: o.id)
end

Location.destroy_all
#每个仓库一个库位
Warehouse.all.each do |w|
  Location.create!(name: "#{w.name}>默认库位",warehouse: w)
end

Equipment.destroy_all
#100件设备
(1...100).each do |index|
  Equipment.create!(name: "设备_#{index}",equipment_category: EquipmentCategory.first,unit: Unit.first)
end

#事故类型
AccidentType.destroy_all
types_1 = %w(火灾 设备 交通 盗窃 刑事治安)
#工伤
types_2 = %w(物体打击 机械工具伤害 高空坠落 触电 爆炸 车辆伤害 其它伤害 人为破坏)
types_1.each_with_index do |t,i|
  AccidentType.create!(name: t,order_by: i+1)
end

types_2.each_with_index do |t,i|
  AccidentType.create!(name: t,order_by: 10 + i ,is_work_injury: true)
end

#工资表项目
SalaryItemHeader.destroy_all
default_salary_item_header = SalaryItemHeader.new(name: "默认工资表")
default_salary_item_header.save!

pay_items = %w(岗位工资 绩效工资 独生子女补助 目标管理奖 绩效考核奖 旺季补贴 补充医疗 年终奖 其它)
deduct_items = %w(养老保险 医疗保险 大病救助 失业保险 住房公积金 企业年金 工资扣个税 目标管理奖扣个税 绩效考核奖扣个税 旺季补贴扣个税 补充医疗扣个税 年终奖扣个税 其它扣个税 水电费)
pay_items.each_with_index do |item,idx|
  default_salary_item_header.salary_items.create(name: item,code: "pay_item_#{idx + 1}",order_by: idx+1,item_type: "pay_item")
end
#应发合计
default_salary_item_header.salary_items.create(name: "应发合计",
                                               code: "pay_item_#{default_salary_item_header.salary_items.length + 1}",
                                               is_calculate: true,
                                               formula: "pay_item_1 + pay_item_2 + pay_item_3 + pay_item_4 + pay_item_5 + pay_item_6 + pay_item_7 + pay_item_8 + pay_item_9",
                                               order_by: default_salary_item_header.salary_items.length + 1,
                                               item_type: "pay_item")
deduct_items.each_with_index do |item,idx|
  default_salary_item_header.salary_items.create(name: item,code: "deduct_item_#{default_salary_item_header.salary_items.length + 1}",
                                                 order_by: default_salary_item_header.salary_items.length+1,item_type: "deduct_item")
end
#扣款合计
default_salary_item_header.salary_items.create(name: "应扣合计",
                                               code: "deduct_item_#{default_salary_item_header.salary_items.length + 1}",
                                               is_calculate: true,
                                               formula: "deduct_item_1 + deduct_item_2 + deduct_item_3 + deduct_item_4 + deduct_item_5 + deduct_item_6 + deduct_item_6 + deduct_item_7 + deduct_item_8 + deduct_item_9 + deduct_item_10 + deduct_item_11 + deduct_item_12 + deduct_item_13 + deduct_item_13",
                                               order_by: default_salary_item_header.salary_items.length + 1,
                                               item_type: "deduct_item")
#实发合计
default_salary_item_header.salary_items.create(name: "实发合计",
                                               code: "pay_item_#{default_salary_item_header.salary_items.length + 1}",
                                               is_calculate: true,
                                               formula: "sum_pay_item - sum_deduct_item",
                                               order_by:  default_salary_item_header.salary_items.length + 1,
                                               item_type: "pay_item")
