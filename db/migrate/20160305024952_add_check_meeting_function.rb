#coding: utf-8
class AddCheckMeetingFunction < ActiveRecord::Migration
  def change
    group_name = "安保-动态情况管理"
    sf_name = "会议信息审批"
    subject = "Meeting"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'check_meetings_path("q[check_state_eq]" => "draft")',
      function: {
        show_check: {name: "审批",conditions: {:check_state => ["draft"]}},
      }
    }
    SystemFunction.create_by_hash(sf_hash)

  end
end
