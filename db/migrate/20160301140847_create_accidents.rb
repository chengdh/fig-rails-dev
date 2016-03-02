#coding: utf-8
#事故月报表
class CreateAccidents < ActiveRecord::Migration
  def change
    create_table :accidents do |t|
      t.integer :accident_header_id,null: false
      t.integer :accident_type_id,null: false
      t.integer :industry_accident_count,default: 0
      t.integer :industry_die_persons,default: 0

      t.integer :industry_wounded_persons,default: 0

      t.decimal :industry_economic_losses,default: 0

      t.text :industry_note
      t.integer :commerical_accident_count,default: 0

      t.integer :commerical_die_persons,default: 0

      t.integer :commerical_wounded_persons,default: 0

      t.decimal :commerical_economic_losses,default: 0
      t.text :commerical_note
      t.text :note

      t.timestamps null: false
    end
  end
end
