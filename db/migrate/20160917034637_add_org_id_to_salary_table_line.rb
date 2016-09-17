#coding: utf-8
class AddOrgIdToSalaryTableLine < ActiveRecord::Migration
  def change
    add_reference :salary_table_lines, :org, index: true
  end
end
