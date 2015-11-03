#coding: utf-8
#添加基础数据
class AddDefaultData < ActiveRecord::Migration
  def change
    web_app = WebApp.find_by_name("开封-SIS系统")
    if web_app.blank?
      WebApp.create(name: "开封-SIS系统",
                    form_el_username: "ctl00$bodyContent$ctl00$Text_UserName",
                    form_el_password: "ctl00$bodyContent$ctl00$Text_Password",
                    form_action: "http://10.78.39.13/Sis.Web/Login.aspx?ReturnUrl=%2fsis.web%2fDefault.aspx")
    else
      web_app.update_attributes(form_action: "http://10.78.39.13/Sis.Web/Login.aspx?ReturnUrl=%2fsis.web%2fDefault.aspx")
    end

    #平顶山-不用登录
    web_app = WebApp.find_by_name("平顶山-SIS系统")
    if web_app.blank?
      WebApp.create(name: "平顶山-SIS系统",
                    form_el_username: "username",
                    form_el_password: "password",
                    form_action: "http://10.78.207.10:8080/aopcpily/")
    else
      web_app.update_attributes(form_action: "http://10.78.207.10:8080/aopcpily/")
    end

    #南阳-不用登录
    web_app = WebApp.find_by_name("南阳-SIS系统")
    if web_app.blank?
      WebApp.create(name: "南阳-SIS系统",
                    form_el_username: "username",
                    form_el_password: "password",
                    form_action: "http://10.78.36.13/sis/main.do")
    else
      web_app.update_attributes(form_action: "http://10.78.36.13/sis/main.do")
    end


    WebApp.create(name: "新乡-生产实时系统",
                  form_el_username: "txtUserName",
                  form_el_password: "txtUserPass",
                  form_action: "http://127.0.0.1/login.aspx")

    UserWebApp.destroy_all

    User.all.each do |u|
      WebApp.all.each do |a|
        UserWebApp.create(user: u,web_app: a)
      end
    end
  end
end
