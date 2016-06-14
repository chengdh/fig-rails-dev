#coding: utf-8
class AddCheckIpInfoHeaderFunction < ActiveRecord::Migration
  def change
    group_name = "信息-IP及VPN管理"
    sf_name = "IP地址变更审批"
    subject = "IpInfoHeader"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'check_ip_info_headers_path("q[check_state_eq]" => "submitted")',
      function: {
        show_check: {name: "审批",conditions: {:check_state => ["submitted"]}}
      }
    }
    SystemFunction.create_by_hash(sf_hash)
  end
end
