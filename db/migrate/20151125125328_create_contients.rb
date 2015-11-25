#coding: utf-8
class CreateContients < ActiveRecord::Migration
  def change
    create_table :t_continents,id: false  do |t|
      t.integer :continents_id
      t.string :cn_name,limit: 20
      t.string :en_name,limit: 20
      t.integer :sort_value

      t.timestamps null: false
    end
    execute "ALTER TABLE t_continents ADD PRIMARY KEY (continents_id);"
  end
end
