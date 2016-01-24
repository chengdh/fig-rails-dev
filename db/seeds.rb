# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Org.destroy_all
root_org = Org.create(name: "南阳市烟草专卖局",address: "河南省南阳市滨河东路1968号",phone: "0377-63588719",email: "nyycbgs@126.com")
child_orgs = %w(邓州市烟草专卖局 桐柏县烟草专卖局 方城县烟草专卖局
淅川县烟草专卖局 镇平县烟草专卖局 唐河县烟草专卖局
南召县烟草专卖局 内乡县烟草专卖局 新野县烟草专卖局
社旗县烟草专卖局 西峡县烟草专卖局 卧龙区烟草专卖局
宛城区烟草专卖局 市局信息处 市局安检处)
child_orgs.each do |o|
  Org.create(name: o,parent: root_org)
end
