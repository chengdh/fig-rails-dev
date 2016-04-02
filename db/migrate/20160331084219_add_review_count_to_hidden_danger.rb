#coding: utf-8
class AddReviewCountToHiddenDanger < ActiveRecord::Migration
  def change
    add_column :hidden_dangers, :review_count, :integer,default: 0
  end
end
