#coding: utf-8
class AddNoteColumnsToSalaryTableLine < ActiveRecord::Migration
  def change
    add_column :salary_table_lines,:note_item_1,:text
    add_column :salary_table_lines,:note_item_2,:text
    add_column :salary_table_lines,:note_item_3,:text
    add_column :salary_table_lines,:note_item_4,:text
    add_column :salary_table_lines,:note_item_5,:text
    add_column :salary_table_lines,:note_item_6,:text
    add_column :salary_table_lines,:note_item_7,:text
    add_column :salary_table_lines,:note_item_8,:text
    add_column :salary_table_lines,:note_item_9,:text
    add_column :salary_table_lines,:note_item_10,:text
  end
end
