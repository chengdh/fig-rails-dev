#coding: utf-8
class ChangeWebsiteFunction < ActiveRecord::Migration
  def change
    website = SystemFunction.find_by_name("综管平台网站后台")
    if website.present?
      website.update_attributes(target: "_blank")
    end
    website = SystemFunction.find_by_name("安保平台网站后台")
    if website.present?
      website.update_attributes(target: "_blank")
    end

  end
end
