#coding: utf-8
class AddCheckCompanyVpnFunction < ActiveRecord::Migration
  def change
    group_name = "信息-网络管理"
    sf_name = "VPN帐号审批"
    subject = "CompanyVpn"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'check_company_vpns_path("q[check_state_eq]" => "submitted")',
      function: {
        show_check: {name: "审批",conditions: {:check_state => ["submitted"]}}
      }
    }
    SystemFunction.create_by_hash(sf_hash)
  end
end
