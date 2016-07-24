#coding: utf-8
class ChangeAssessmentFunction < ActiveRecord::Migration
  def change
    sf = SystemFunction.find_by(name: "考评表上报")
    sf.update_attributes(name: "考评表") if sf.present?


    sf = SystemFunction.find_by(name: "考评表审批")
    sf.update_attributes(is_active: false) if sf.present?
  end
end
