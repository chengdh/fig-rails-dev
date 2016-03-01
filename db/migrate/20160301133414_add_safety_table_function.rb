#coding: utf-8
class AddSafetyTableFunction < ActiveRecord::Migration
  def change
    group_name = "安保-动态情况管理"
    sf_name = "安全工作情况月报"
    subject = "SafetyTable"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'safety_tables_path("q[org_id_in]" => current_ability_org_ids,"q[mth_eq]" => 1.month.ago.strftime("%Y%m"))',
      function: {
        create: {name: "新建"},
        update: {name: "修改"},
        destroy: {name:"删除"}
      }
    }
    SystemFunction.create_by_hash(sf_hash)



  end
end
