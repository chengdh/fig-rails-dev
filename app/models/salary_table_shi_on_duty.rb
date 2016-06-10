#coding: utf-8
#市局在岗-工资表
class SalaryTableShiOnDuty < SalaryTable
  #获取对应的工资模板
  def self.get_salary_item_header
    ret = SalaryItemHeader.find_by(code: SalaryItemHeader::CODE_SHI_ON_DUTY)
    ret
  end
end
