#coding: utf-8
class AddCheckSafetyTableFunction < ActiveRecord::Migration
  def change
    group_name = "安保-动态情况管理"
    sf_name = "安全工作月报审批"
    subject = "SafetyTable"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'check_safety_tables_path("q[check_state_eq]" => "draft")',
      function: {
        show_check: {name: "审批",conditions: {:check_state => ["submitted"]}}
      }
    }
    SystemFunction.create_by_hash(sf_hash)
  end
end
