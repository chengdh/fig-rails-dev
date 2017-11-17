#coding: utf-8
#总账
class CreateCuxGlJeHeaders < ActiveRecord::Migration
  def change
    create_table :cux_gl_je_headers_a do |t|
      t.string :name
      t.string :description
      t.integer :doc_sequence_value
      t.string :period_name
      t.date :default_effective_date
      t.string :external_reference
      t.date :creation_date
      t.date :last_update_date
      t.timestamps null: false
    end
  end
end
