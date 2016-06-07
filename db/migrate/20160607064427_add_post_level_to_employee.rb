#coding: utf-8
#添加字段
class AddPostLevelToEmployee < ActiveRecord::Migration
  def change
    #职级
    add_column :employees, :post_level, :integer,default: 9
    #是否党员
    add_column :employees, :is_party_member, :boolean,default: false

    #所属支部
    add_column :employees, :belongs_party, :string
    #工作状态
    add_column :employees, :work_state, :string,default: 'on_duty'
  end
end
