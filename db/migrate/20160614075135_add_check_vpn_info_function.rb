#coding: utf-8
class AddCheckVpnInfoFunction < ActiveRecord::Migration
  def change
    group_name = "信息-IP及VPN管理"
    sf_name = "IPSEC-VPN帐号审批"
    subject = "VpnInfo"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'check_vpn_infos_path("q[check_state_eq]" => "submitted")',
      function: {
        show_check: {name: "审批",conditions: {:check_state => ["submitted"]}}
      }
    }
    SystemFunction.create_by_hash(sf_hash)
  end
end
