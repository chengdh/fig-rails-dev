#coding: utf-8
#需求计划表头
class CreateCuxDemandPlatformHeadersAVs < ActiveRecord::Migration
  def change
    create_table :cux_demand_platform_headers_a do |t|
      t.string :apply_number,limit: 30
      t.string :ou_name,limit: 60
      t.integer :org_id
      t.datetime :apply_date
      t.string :apply_source,limit: 30

      t.string :apply_deparment,limit: 30

      t.string :applier_user,limit: 30

      t.string :apply_type,limit: 30

      t.text :remark
      t.string :project_number,limit: 30

      t.string :project_name,limit: 300

      t.string :task_name,limit: 300

      t.string :task_number,limit: 30

      t.string :urge_flag,limit: 30

      t.string :attribute1,limit: 30

      t.integer :wip_entity_id
      t.string :wip_entity_name,limit: 30

      t.decimal :bugdet_total,default: 0,precision: 15,scale: 2
      t.decimal :bugdet_demand_total,default: 0,precision: 15,scale: 2

      t.decimal :header_bugdet,default: 0,precision: 15,scale: 2

      t.decimal :bugdet_balance,default: 0,precision: 15,scale: 2

      t.decimal :actual_cost,default: 0,precision: 15,scale: 2


      t.timestamps null: false
    end
  end
end
