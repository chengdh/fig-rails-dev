#coding: utf-8
class AddDirectLoginUrlToWebApp < ActiveRecord::Migration
  def change
    add_column :web_apps,:direct_login_url,:text
  end
end
