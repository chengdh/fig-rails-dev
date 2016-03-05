#coding: utf-8
class AddDangerOrgHiddenDangerFunction < ActiveRecord::Migration
  def change
    group_name = "安保-动态情况管理"
    sf_name = "事故隐患整改"
    subject = "HiddenDanger"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'danger_org_hidden_dangers_path("q[fixed_state_eq]" => "deliveried")',
      function: {
        fix: {name: "整改",conditions: {:fixed_state => ["deliveried"]}},
      }
    }
    SystemFunction.create_by_hash(sf_hash)

  end
end
