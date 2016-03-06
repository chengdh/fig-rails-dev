#coding: utf-8
class AddTaskCategoryFunction < ActiveRecord::Migration
  def change
    group_name = "任务管理"
    sf_name = "任务分类"
    subject = "TaskCategory"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'task_categories_path',
      function: {
        read: {name: "查看"},
        create: {name: "新建"},
        update: {name: "修改"},
        destroy: {name:"删除"}
      }
    }
    SystemFunction.create_by_hash(sf_hash)
  end
end
