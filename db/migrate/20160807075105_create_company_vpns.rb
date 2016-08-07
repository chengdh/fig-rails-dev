#coding: utf-8
class CreateCompanyVpns < ActiveRecord::Migration
  def change
    create_table :company_vpns do |t|
      t.references :org, index: true, null: false
      t.date :table_date
      t.references :user, index: true, null: false
      t.integer :submitter_id
      t.date :submit_date
      t.text :submit_note,limit: 200
      t.integer :checker_id
      t.date :check_date
      t.text :check_opinion,limit: 200
      t.text :note
      t.string :check_state,limit: 40

      t.timestamps null: false
    end
  end
end
