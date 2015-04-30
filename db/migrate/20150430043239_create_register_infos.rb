#coding: utf-8
class CreateRegisterInfos < ActiveRecord::Migration
  def change
    create_table :register_infos do |t|
      t.string :company_name,limit: 60,null: false
      t.string :legal_code,limit: 60,null: false
      t.string :address,limit: 60
      t.string :legaler,limit: 60
      t.string :union_company_name,limit: 60
      t.integer :logistics_level
      t.string :project_manager,limit: 60
      t.string :pm_phone,limit: 20
      t.string :pm_fax,limit: 20
      t.string :pm_mobile,limit: 20

      t.decimal :capital,precision: 15,scale: 2,default: 0.0
      t.date :register_date
      t.integer :ec_typee

      t.decimal :income_2012,precision: 15,scale: 2,default: 0.0
      t.decimal :profit_2012,precision: 15,scale: 2,default: 0.0
      t.integer :employees_count_2012,default: 0


      t.decimal :asset_2012,precision: 15,scale: 2,default: 0.0
      t.decimal :pure_asset_2012,precision: 15,scale: 2,default: 0.0
      t.decimal :tax_2011,precision: 15,scale: 2,default: 0.0
      t.decimal :tax_2012,precision: 15,scale: 2,default: 0.0
      t.decimal :profit_pure_asset_2012,precision: 15,scale: 2,default: 0.0
      t.decimal :profit_flow_asset_2012,precision: 15,scale: 2,default: 0.0
      t.decimal :rate_balance_2012,precision: 15,scale: 2,default: 0.0

      t.string :project_name,limit: 60
      t.text :project_context
      t.text :project_kpi
      t.string :project_belongs
      t.date :project_begin_date
      t.date :project_end_date


      t.decimal :project_sum_invest,precision: 15,scale: 2,default: 0.0
      t.decimal :project_sum_invest_self,precision: 15,scale: 2,default: 0.0
      t.decimal :project_sum_invest_loan,precision: 15,scale: 2,default: 0.0

      t.decimal :project_sum_apply,precision: 15,scale: 2,default: 0.0
      t.integer :project_apply_type


      t.decimal :project_already_invest_2012,precision: 15,scale: 2,default: 0.0
      t.decimal :project_already_invest_2013,precision: 15,scale: 2,default: 0.0
      t.integer :is_important,default: 0


      t.timestamps null: false
    end
  end
end
