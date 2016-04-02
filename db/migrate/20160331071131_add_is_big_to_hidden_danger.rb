#coding: utf-8
#给隐患信息增加部分字段
class AddIsBigToHiddenDanger < ActiveRecord::Migration
  def change
    add_column :hidden_dangers, :is_big, :boolean,default: false
    add_column :hidden_dangers, :fixed_note, :text
    add_column :hidden_dangers, :review_note, :text
    add_column :hidden_dangers, :bill_no, :string,null: false
    add_column :hidden_dangers, :checker_name, :string,limit: 30
    add_column :hidden_dangers, :check_date, :date
    add_column :hidden_dangers, :k_marks, :decimal,precision: 15,scale: 2,default: 0
  end
end
