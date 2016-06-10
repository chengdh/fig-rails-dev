#coding: utf-8
class SalaryReportShi < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  has_many :salary_report_shi_lines
end
