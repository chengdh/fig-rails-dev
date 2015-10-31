#coding: utf-8
#添加基础数据
class AddDefaultData < ActiveRecord::Migration
  def change
    WebApp.create(name: "开封-SIS系统",
                  form_el_username: "ctl00$bodyContent$ctl00$Text_UserName",
                  form_el_password: "ctl00$bodyContent$ctl00$Text_Password",
                  form_action: "http://127.0.0.1/Login.aspx")

    WebApp.create(name: "南阳-生产实时系统",
                  form_el_username: "name",
                  form_el_password: "password",
                  form_action: "http://127.0.0.1/sis/login?method=login")
    WebApp.create(name: "新乡-生产实时系统",
                  form_el_username: "txtUserName",
                  form_el_password: "txtUserPass",
                  form_action: "http://127.0.0.1/login.aspx")

    User.all.each do |u|
      WebApp.all.each do |a|
        UserWebApp.create(user: u,web_app: a)
      end
    end
  end
end
