#coding: utf-8
#工资表-县局在岗
class SalaryTableXianOnDuty < SalaryTable
  #获取对应的工资模板
  def self.get_salary_item_header
    ret = SalaryItemHeader.find_by(code: SalaryItemHeader::CODE_XIAN_ON_DUTY)
    ret
  end
end
