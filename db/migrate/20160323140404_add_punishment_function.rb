#coding: utf-8
class AddPunishmentFunction < ActiveRecord::Migration
  def change
    group_name = "安保-动态情况管理"
    sf_name = "处罚信息管理"
    subject = "Punishment"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'punishments_path("q[check_state_eq]" => "draft")',
      function: {
        read: {name: "查看"},
        create: {name: "新建"},
        confirm: {name: "发布",conditions: {:check_state => ["draft"]}},
        update: {name: "修改",conditions: {:check_state => ["draft"]}},
        destroy: {name:"删除",conditions: {:check_state => ["draft"]}}
      }
    }
    SystemFunction.create_by_hash(sf_hash)
  end
end
