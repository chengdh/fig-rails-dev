#coding: utf-8
#添加form-url
class AddFormUrlToWebApp < ActiveRecord::Migration
  def change
    add_column :web_apps, :form_url, :text
  end
end
