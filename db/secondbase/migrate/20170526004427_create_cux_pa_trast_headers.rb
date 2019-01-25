#coding: utf-8
#项目资产信息
class CreateCuxPaTrastHeaders < ActiveRecord::Migration
  def change
    create_table :cux_pa_trast_header_a,id: false do |t|
      t.integer :header_id
      t.integer :project_id
      t.integer :task_id
      t.string :asset_name
      t.integer :asset_quantity
      t.decimal :cost,precision: 15,scale: 2
      t.integer :asset_category_id
      t.string :model_number
      t.string :contract_number
      t.string :asset_num
      t.string :manufacturer_name
      t.string :asset_number

      t.timestamps null: false
    end
  end
end
