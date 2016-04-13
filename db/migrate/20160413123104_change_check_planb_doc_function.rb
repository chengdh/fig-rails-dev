#coding: utf-8
class ChangeCheckPlanbDocFunction < ActiveRecord::Migration
  def change
    sf = SystemFunction.find_by(name: "应急预案演练信息审批")
    update_attrs = {
      subject: "PlanbDoc",
      default_action: "check_planb_docs_path('q[check_state_eq]' => 'submitted')",
      function: {
        show_check: {name: "审批",conditions: {:check_state => ["submitted"]}}
      }
    }
    sf.update_by_hash(update_attrs) if sf.present?
  end
end
