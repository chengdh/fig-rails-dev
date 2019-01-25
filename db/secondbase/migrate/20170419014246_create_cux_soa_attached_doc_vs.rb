#coding: utf-8
#附件信息视图
class CreateCuxSoaAttachedDocVs < ActiveRecord::Migration
  def change
    create_table :cux_soa_attached_doc_v,id: false do |t|
      t.integer :seq_num
      t.string :file_name
      t.string :category_description
      t.string :datatype_name
      t.integer :datatype_id
      t.integer :media_id
      t.string :table_name
      t.string :pk1_column

      t.timestamps null: false
    end
  end
end
