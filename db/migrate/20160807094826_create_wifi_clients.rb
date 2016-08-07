#coding: utf-8
class CreateWifiClients < ActiveRecord::Migration
  def change
    create_table :wifi_clients do |t|
      t.references :org, index: true, null: true
      t.date :table_date
      t.references :user, index: true
      t.integer :submitter_id
      t.date :submit_date
      t.string :submit_note,limit: 200
      t.integer :checker_id
      t.date :check_date
      t.string :check_opinion,limit: 200
      t.text :note
      t.string :check_state,limit: 40

      t.timestamps null: false
    end
  end
end
