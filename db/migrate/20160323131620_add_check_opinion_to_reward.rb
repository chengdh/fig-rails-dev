#coding: utf-8
class AddCheckOpinionToReward < ActiveRecord::Migration
  def change
    add_column :rewards,:check_opinion,:string,limit: 600
  end
end
