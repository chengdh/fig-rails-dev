#coding: utf-8
class AddNoteToPoLine < ActiveRecord::Migration
  def change
    add_column :po_lines, :note, :string,limit: 30
  end
end
