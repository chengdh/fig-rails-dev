# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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
