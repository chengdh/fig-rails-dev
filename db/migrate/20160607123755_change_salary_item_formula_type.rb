#coding: utf-8
class ChangeSalaryItemFormulaType < ActiveRecord::Migration
  def change
    change_column :salary_items,:formula,:text
  end
end
