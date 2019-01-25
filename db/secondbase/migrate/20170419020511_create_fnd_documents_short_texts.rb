#coding: utf-8
#短文本内容表
class CreateFndDocumentsShortTexts < ActiveRecord::Migration
  def change
    create_table :fnd_documents_short_text,id: false do |t|
      t.integer :media_id
      t.text :short_text
      t.string :app_source_version

      t.timestamps null: false
    end
  end
end
