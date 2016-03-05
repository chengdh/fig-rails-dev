#coding: utf-8
class AddHiddenDangerFunction < ActiveRecord::Migration
  def change
    group_name = "安保-动态情况管理"
    sf_name = "事故隐患整改处理"
    subject = "HiddenDanger"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'hidden_dangers_path("q[fixed_state_eq]" => "draft")',
      function: {
        read: {name: "查看"},
        create: {name: "新建"},
        update: {name: "修改",conditions: {:fixed_state => ["draft"]}},
        destroy: {name:"删除",conditions: {:fixed_state => ["draft"]}},
        deliver: {name:"下发",conditions: {:fixed_state => ["draft"]}},
        review: {name:"复查",conditions: {:fixed_state => ["fixed","processing"]}},
      }
    }
    SystemFunction.create_by_hash(sf_hash)

  end
end
