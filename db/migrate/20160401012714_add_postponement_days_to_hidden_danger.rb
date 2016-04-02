#coding: utf-8
class AddPostponementDaysToHiddenDanger < ActiveRecord::Migration
  def change
    #延期时间
    add_column :hidden_dangers, :postponement_days, :integer,default: 0
  end
end
