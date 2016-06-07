#coding: utf-8
class AddWorkStateToSalaryTable < ActiveRecord::Migration
  def change
    add_column :salary_tables, :work_state, :string,limit: 60
  end
end
