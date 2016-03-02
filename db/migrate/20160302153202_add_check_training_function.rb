#coding: utf-8
class AddCheckTrainingFunction < ActiveRecord::Migration
  def change
    group_name = "安保-动态情况管理"
    sf_name = "教育培训信息审批"
    subject = "Training"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'check_trainings_path(check_state: "draft")',
      function: {
        show_check: {name: "审批",conditions: {:check_state => ["draft"]}},
      }
    }
    SystemFunction.create_by_hash(sf_hash)
  end
end
