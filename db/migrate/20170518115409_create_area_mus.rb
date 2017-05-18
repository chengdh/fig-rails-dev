#coding: utf-8
class CreateAreaMus < ActiveRecord::Migration
  def change
    create_table :area_mus do |t|
      t.references :area_info, index: true, foreign_key: true
      t.date :submit_date
      t.decimal :mu_result,precision: 15,scale: 2,default: 0
      t.decimal :mu_percent,precision: 15,scale: 2,default: 0

      t.timestamps null: false
    end
  end
end
