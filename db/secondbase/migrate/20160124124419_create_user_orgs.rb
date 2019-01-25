#coding: utf-8
#用户-机构
class CreateUserOrgs < ActiveRecord::Migration
  def change
    create_table :user_orgs do |t|
      t.references :user, index: true, foreign_key: true
      t.references :org, index: true, foreign_key: true
      t.boolean :is_select,default: false

      t.timestamps null: false
    end
  end
end
