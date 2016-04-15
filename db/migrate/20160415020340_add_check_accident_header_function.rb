#coding: utf-8
class AddCheckAccidentHeaderFunction < ActiveRecord::Migration
  def change
    group_name = "安保-动态情况管理"
    sf_name = "事故报告审批"
    subject = "AccidentHeader"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'check_accident_headers_path("q[check_state_eq]" => "submitted")',
      function: {
        show_check: {name: "审批",conditions: {:check_state => ["submitted"]}}
      }
    }
    SystemFunction.create_by_hash(sf_hash)
  end
end
