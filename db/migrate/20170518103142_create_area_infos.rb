#coding: utf-8
#区域信息
class CreateAreaInfos < ActiveRecord::Migration
  def change
    create_table :area_infos do |t|
      t.string :code,limit: 20
      t.decimal :total_area,precision: 15,scale: 2,default: 0

      t.timestamps null: false
    end
  end
end
