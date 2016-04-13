#coding: utf-8
class ChangeCheckMeetingFunction < ActiveRecord::Migration
  def change
    sf = SystemFunction.find_by(name: "会议信息审批")
    update_attrs = {
      subject: "Meeting",
      default_action: "check_meetings_path('q[check_state_eq]' => 'submitted')",
      function: {
        show_check: {name: "审批",conditions: {:check_state => ["submitted"]}}
      }
    }
    sf.update_by_hash(update_attrs) if sf.present?
  end
end
