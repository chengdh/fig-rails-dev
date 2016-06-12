class CreateSalaryReportLeaderLines < ActiveRecord::Migration
  def change
    create_table :salary_report_leader_lines do |t|
      t.references :salary_report_leader, index: true
      t.references :employee,index: true
      t.string :name ,limit: 60
      t.string :id_no,limit: 60
      t.string :post, limit: 60
      t.integer :post_level, index: true
      t.boolean :is_party_member
      t.string :belongs_party, limit: 60
      t.boolean :is_not_main

      t.decimal :wage_before_last,default: 0,precision: 15,sacel: 2
      t.decimal :wage_last,default: 0,precision: 15,sacel: 2


      t.decimal :sum_income_last,default: 0,precision: 15,sacel: 2
      t.decimal :pre_sum_income_last,default: 0,precision: 15,sacel: 2
      t.decimal :bu_sum_income_last,default: 0,precision: 15,sacel: 2

      t.decimal :bu_sum_income_this_year,default: 0,precision: 15,sacel: 2

      #补发当年预发薪酬
      t.decimal :should_bu_this_year,precision: 15,scale: 2,default: 0
      t.decimal :bu_tax_this_year,precision: 15,scale: 2,default: 0
      t.decimal :bu_act_this_year,precision: 15,scale: 2,default: 0

      #补发上年度薪酬
      t.decimal :should_bu_last_year,precision: 15,scale: 2,default: 0
      t.decimal :bu_tax_last_year,precision: 15,scale: 2,default: 0
      t.decimal :bu_act_last_year,precision: 15,scale: 2,default: 0
      t.string :note,limit: 200

      t.timestamps null: false
    end
    (1..13).each do |i|
      (1..20).each do |j|
        add_column :salary_report_leader_lines,"mth_#{i}st_pay_item_#{j}",:decimal,precision: 15,scale: 2,default: 0
        add_column :salary_report_leader_lines,"mth_#{i}st_deduct_item_#{j}",:decimal,precision: 15,scale: 2,default: 0
      end
    end
  end
end
