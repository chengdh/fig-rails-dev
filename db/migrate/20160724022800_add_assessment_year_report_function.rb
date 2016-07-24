#coding: utf-8
#安全考评年表统计
class AddAssessmentYearReportFunction < ActiveRecord::Migration
  def change
    group_name = "安保-考评管理"
    sf_name = "全年考评表"
    subject = "Assessment"
    sf_hash = {
      group_name:  group_name,
      name: sf_name,
      subject: subject,
      default_action: 'year_report_assessments_path("q[mth_gteq]"=> Date.today.beginning_of_year.strftime("%Y%m"),"q[mth_lteq]"=> Date.today.end_of_year.strftime("%Y%m"))',
      function: {
        year_report: {name: "全年考评表"}
      }
    }
    SystemFunction.create_by_hash(sf_hash)
  end
end
