#coding: utf-8
#网站后台
class Website < ActiveRecord::Base
  def backend_login_url
    "#{backend_url}?username=#{username}&password=#{password}"
  end
  def self.zg_backend_login_url
    website = Website.find_by(name: "综管平台网站")
    website.backend_login_url
  end
  def self.anbao_backend_login_url
    website = Website.find_by(name: "安保平台网站")
    website.backend_login_url
  end
end
