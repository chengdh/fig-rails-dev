#coding: utf-8
class ChangeCompanyVpnFunction < ActiveRecord::Migration
  def change
    sf = SystemFunction.find_by(name: "城区分公司VPN帐号申请表")
    sf.update_attributes(name: "VPN帐号申请表") if sf.present?
  end
end
