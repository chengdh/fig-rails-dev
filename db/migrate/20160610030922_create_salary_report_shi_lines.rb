#coding: utf-8
#工资表-市局汇总明细
class CreateSalaryReportShiLines < ActiveRecord::Migration
  def change
    create_table :salary_report_shi_lines do |t|
      t.references :salary_report_shi, index: true
      t.string :work_state,limit: 60
      t.string :post_level,limit: 60
      t.boolean :is_not_main

      t.integer :mth_1st_persons,default: 0
      t.decimal :mth_1st_shoud_pay,precision: 15,scale: 2
      t.decimal :mth_1st_act_pay,precision: 15,scale: 2
      t.text :mth_1st_persons_change

      t.integer :mth_2st_persons,default: 0
      t.decimal :mth_2st_shoud_pay,precision: 15,scale: 2
      t.decimal :mth_2st_act_pay,precision: 15,scale: 2
      t.text :mth_2st_persons_change

      t.integer :mth_3st_persons,default: 0
      t.decimal :mth_3st_shoud_pay,precision: 15,scale: 2
      t.decimal :mth_3st_act_pay,precision: 15,scale: 2
      t.text :mth_3st_persons_change

      t.integer :mth_4st_persons,default: 0
      t.decimal :mth_4st_shoud_pay,precision: 15,scale: 2
      t.decimal :mth_4st_act_pay,precision: 15,scale: 2
      t.text :mth_4st_persons_change

      t.integer :mth_5st_persons,default: 0
      t.decimal :mth_5st_shoud_pay,precision: 15,scale: 2
      t.decimal :mth_5st_act_pay,precision: 15,scale: 2
      t.text :mth_5st_persons_change

      t.integer :mth_6st_persons,default: 0
      t.decimal :mth_6st_shoud_pay,precision: 15,scale: 2
      t.decimal :mth_6st_act_pay,precision: 15,scale: 2
      t.text :mth_6st_persons_change

      t.integer :mth_7st_persons,default: 0
      t.decimal :mth_7st_shoud_pay,precision: 15,scale: 2
      t.decimal :mth_7st_act_pay,precision: 15,scale: 2
      t.text :mth_7st_persons_change

      t.integer :mth_8st_persons,default: 0
      t.decimal :mth_8st_shoud_pay,precision: 15,scale: 2
      t.decimal :mth_8st_act_pay,precision: 15,scale: 2
      t.text :mth_8st_persons_change

      t.integer :mth_9st_persons,default: 0
      t.decimal :mth_9st_shoud_pay,precision: 15,scale: 2
      t.decimal :mth_9st_act_pay,precision: 15,scale: 2
      t.text :mth_9st_persons_change



      t.integer :mth_10st_persons,default: 0
      t.decimal :mth_10st_shoud_pay,precision: 15,scale: 2
      t.decimal :mth_10st_act_pay,precision: 15,scale: 2
      t.text :mth_10st_persons_change

      t.integer :mth_11st_persons,default: 0
      t.decimal :mth_11st_shoud_pay,precision: 15,scale: 2
      t.decimal :mth_11st_act_pay,precision: 15,scale: 2
      t.text :mth_11st_persons_change

      t.integer :mth_12st_persons,default: 0
      t.decimal :mth_12st_shoud_pay,precision: 15,scale: 2
      t.decimal :mth_12st_act_pay,precision: 15,scale: 2
      t.text :mth_12st_persons_change

      t.integer :mth_13st_persons,default: 0
      t.decimal :mth_13st_shoud_pay,precision: 15,scale: 2
      t.decimal :mth_13st_act_pay,precision: 15,scale: 2
      t.text :mth_13st_persons_change

      t.timestamps null: false
    end
  end
end
