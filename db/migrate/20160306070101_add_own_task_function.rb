#coding: utf-8
class AddOwnTaskFunction < ActiveRecord::Migration
  def change
    group_name = "任务管理"
    sf_name = "任务进度反馈"
    subject = "Task"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'own_tasks_path("q[state_eq]" => "draft")',
      function: {
        show_line: {name: "进度反馈",conditions: {:state => ["deliveried","processing"]}},
        finish: {name: "完成任务",conditions: {:state => ["deliveried","processing"]}},
      }
    }
    SystemFunction.create_by_hash(sf_hash)
  end
end
