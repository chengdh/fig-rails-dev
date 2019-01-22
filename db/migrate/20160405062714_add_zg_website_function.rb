#coding: utf-8
#添加综管网站后台管理功能
class AddZgWebsiteFunction < ActiveRecord::Migration
  def change
    group_name = "网站后台管理"
    sf_name = "综管平台网站后台"
    subject = "Website"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'Website.zg_backend_login_url',
      function: {
        admin_nanyang: {name: "后台管理"}
      }
    }
    SystemFunction.create_by_hash(sf_hash)
  end
end