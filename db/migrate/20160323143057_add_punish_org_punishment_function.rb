#coding: utf-8
class AddPunishOrgPunishmentFunction < ActiveRecord::Migration
  def change
    group_name = "安保-动态情况管理"
    sf_name = "查看处罚信息-下级"
    subject = "Punishment"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'punish_org_punishments_path',
      function: {
        read_confirmed: {name: "查看"}
      }
    }
    SystemFunction.create_by_hash(sf_hash)

  end
end
