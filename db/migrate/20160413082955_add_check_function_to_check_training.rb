#coding: utf-8
class AddCheckFunctionToCheckTraining < ActiveRecord::Migration
  def change
    sf = SystemFunction.find_by(name: "教育培训信息审批")
    update_attrs = {
      subject: "Training",
      default_action: "check_trainings_path('q[check_state_eq]' => 'submitted')",
      function: {
        show_check: {name: "审批",conditions: {:check_state => ["submitted"]}}
      }
    }
    sf.update_by_hash(update_attrs) if sf.present?
  end
end
