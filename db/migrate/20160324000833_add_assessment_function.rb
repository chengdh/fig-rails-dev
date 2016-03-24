#coding: utf-8
class AddAssessmentFunction < ActiveRecord::Migration
  def change
    group_name = "安保-考评管理"
    sf_name = "考评表上报"
    subject = "Assessment"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'assessments_path("q[check_state_eq]" => ["draft","rejected"])',
      function: {
        read: {name: "查看"},
        create: {name: "新建"},
        submit: {name: "上报",conditions: {:check_state => ["draft"]}},
        update: {name: "修改",conditions: {:check_state => ["draft","rejected"]}},
        destroy: {name:"删除",conditions: {:check_state => ["draft","rejected"]}}
      }
    }
    SystemFunction.create_by_hash(sf_hash)
  end
end
