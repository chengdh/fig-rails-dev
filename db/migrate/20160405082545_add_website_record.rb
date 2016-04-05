#coding: utf-8
class AddWebsiteRecord < ActiveRecord::Migration
  def change
    Website.destroy_all
    website = Website.find_by_name("综管平台网站")
    if website.blank?
      Website.create!(name: "综管平台网站",home_url: "http://10.67.192.116/nanyang",backend_url: "http://10.67.192.116/nanyang/admin.php",username: "admin",password: "admin")
    end
    website = Website.find_by_name("安保平台网站")
    if website.blank?
      Website.create!(name: "安保平台网站",home_url: "http://10.67.192.116/html/website",backend_url: "http://10.67.192.116/html/website/admin.php",username: "admin",password: "admin")
    end
  end
end
