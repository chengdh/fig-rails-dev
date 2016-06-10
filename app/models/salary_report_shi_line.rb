#coding: utf-8
#工资表-市局汇总表明细
class SalaryReportShiLine < ActiveRecord::Base
  belongs_to :salary_report_shi
  validates :name,:year,:org_id, presence: true

  default_value_for :table_date do
    Date.today
  end
end
