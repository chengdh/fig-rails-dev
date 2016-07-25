#coding: utf-8
class ChangeAssessmentDefaultAction < ActiveRecord::Migration
  def change
    sf_name = "考评表"
    sf = SystemFunction.find_by(name: sf_name)
    default_action = 'assessments_path("q[mth_eq]" => 1.months.ago.strftime("%Y%m"))'
    sf.update_attributes(default_action: default_action) if sf.present?
  end
end
