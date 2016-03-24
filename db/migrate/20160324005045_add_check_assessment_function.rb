#coding: utf-8
class AddCheckAssessmentFunction < ActiveRecord::Migration
  def change
    group_name = "安保-考评管理"
    sf_name = "考评表审批"
    subject = "Assessment"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'check_assessments_path("q[check_state_eq]" => "submited")',
      function: {
        show_check: {name: "审批",conditions: {:check_state => ["submited"]}},
      }
    }
    SystemFunction.create_by_hash(sf_hash)
  end
end
