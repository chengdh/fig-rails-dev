#coding: utf-8
#大数据附件
class CreateFndLobs < ActiveRecord::Migration
  def change
    create_table :fnd_lob,id: false do |t|
      t.integer :file_id
      t.string :file_name
      t.string :file_content_type
      t.text :file_data,limit: 4294967295
      t.datetime :upload_date
      t.datetime :expiration_date
      t.string :program_name
      t.string :program_tag
      t.string :language
      t.string :oracle_charset
      t.string :file_format

      t.timestamps null: false
    end
  end
end
