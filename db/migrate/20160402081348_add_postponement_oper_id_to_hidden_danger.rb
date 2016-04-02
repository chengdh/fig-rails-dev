#coding: utf-8
class AddPostponementOperIdToHiddenDanger < ActiveRecord::Migration
  def change
    add_column :hidden_dangers, :postponement_oper_id, :integer
    add_column :hidden_dangers, :postponement_date, :string
    add_column :hidden_dangers, :postponement_note, :text
  end
end
