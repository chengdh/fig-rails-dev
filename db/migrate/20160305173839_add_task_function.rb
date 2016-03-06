#coding: utf-8
class AddTaskFunction < ActiveRecord::Migration
  def change
    group_name = "任务管理"
    sf_name = "任务管理"
    subject = "Task"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'tasks_path("q[state_eq]" => "draft")',
      function: {
        read: {name: "查看"},
        create: {name: "新建"},
        update: {name: "修改",conditions: {:state => "draft"}},
        destroy: {name:"删除",conditions: {:state => "draft"}},
        deliver: {name: "发布",conditions: {:state => "draft"}},
        confirm: {name: "确认完成",conditions: {:state => "finished"}}
      }
    }
    SystemFunction.create_by_hash(sf_hash)
  end
end
