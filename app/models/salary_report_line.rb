#coding: utf-8
#领导干部薪酬台帐明细
class SalaryReportLine < ActiveRecord::Base
  belongs_to :base_salary_report
  belongs_to :employee

  #根据表达式计算合计
  #目前exp 只支持加法运算
  def cal_sum(exp)
    ret = 0
    (1..13).each do |mth|
      ret += send(:cal_item,mth,exp)
    end
    ret
  end

  #根据表达式计算收入及扣除项
  #目前exp 只支持加法运算
  def cal_item(mth,exp)
    ret = 0
    cols = exp.split("+")
    cols.each do |c|
      col = "mth_#{mth}st_#{c.strip}"
      ret += send(col.to_sym)
    end
    ret
  end
end
