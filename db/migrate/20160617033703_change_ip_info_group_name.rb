#coding: utf-8
class ChangeIpInfoGroupName < ActiveRecord::Migration
  def change
    sfg = SystemFunctionGroup.find_by(name: "信息-IP及VPN管理")
    sfg.update_attributes(name: "信息-网络管理") if sfg.present?
  end
end
