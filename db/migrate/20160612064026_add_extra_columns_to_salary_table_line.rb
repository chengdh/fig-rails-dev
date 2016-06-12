#coding: utf-8
class AddExtraColumnsToSalaryTableLine < ActiveRecord::Migration
  def change
    add_column :salary_table_lines, :name, :string,limit: 60
    add_column :salary_table_lines, :id_no, :string,limit: 60
    add_column :salary_table_lines, :post, :string,limit: 60
    add_column :salary_table_lines, :post_level, :integer
    add_column :salary_table_lines, :is_party_member, :boolean
    add_column :salary_table_lines, :belongs_party, :string,limit: 60
    add_column :salary_table_lines, :is_not_main, :boolean
  end
end
