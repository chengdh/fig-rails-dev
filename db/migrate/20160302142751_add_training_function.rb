#coding: utf-8
class AddTrainingFunction < ActiveRecord::Migration
  def change
    group_name = "安保-动态情况管理"
    sf_name = "教育培训信息录入"
    subject = "Training"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'trainings_path',
      function: {
        create: {name: "新建"},
        update: {name: "修改",conditions: {:check_state => ["draft","rejected"]}},
        destroy: {name:"删除",conditions: {:check_state => ["draft","rejected"]}}
      }
    }
    SystemFunction.create_by_hash(sf_hash)
  end
end
