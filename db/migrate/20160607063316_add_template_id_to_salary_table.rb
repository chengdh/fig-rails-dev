#coding: utf-8
class AddTemplateIdToSalaryTable < ActiveRecord::Migration
  def change
    add_reference :salary_tables, :salary_item_header, index: true
  end
end
