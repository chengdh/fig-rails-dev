#coding: utf-8
#长文本内容表
class CreateFndDocumentsLongTexts < ActiveRecord::Migration
  def change
    create_table :fnd_documents_long_text,id: false do |t|
      t.integer :media_id
      t.string :app_source_version
      t.text :long_text

      t.timestamps null: false
    end
  end
end
