#coding: utf-8
class AddVpnInfoFunction < ActiveRecord::Migration
  def change
    group_name = "信息-IP及VPN管理"

    sf_name = "IPSEC-VPN帐号信息登记表"
    subject = "VpnInfo"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'vpn_infos_path',
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
