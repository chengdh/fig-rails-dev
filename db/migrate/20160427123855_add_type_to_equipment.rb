#coding: utf-8
#给设备类型添加类型字段
class AddTypeToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :type, :string,limit: 60
  end
end
