#coding: utf-8
class DropMthFormAccidents < ActiveRecord::Migration
  def change
    remove_column :accidents,:mth
  end
end
