#coding: utf-8
#工资表-市局汇总表明细
class SalaryReportXianLine < ActiveRecord::Base
  belongs_to :salary_report_xian
end
