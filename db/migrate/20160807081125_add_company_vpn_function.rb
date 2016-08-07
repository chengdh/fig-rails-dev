#coding: utf-8
class AddCompanyVpnFunction < ActiveRecord::Migration
  def change
    group_name = "信息-网络管理"

    sf_name = "城区分公司VPN帐号申请表"
    subject = "CompanyVpn"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'company_vpns_path',
      function: {
        read: {name: "查看"},
        create: {name: "新建"},
        update: {name: "修改"},
        destroy: {name:"删除"},
        submit: {name: "上报",conditions: {check_state: ["draft","rejected"]}}
      }
    }
    SystemFunction.create_by_hash(sf_hash)
  end
end
