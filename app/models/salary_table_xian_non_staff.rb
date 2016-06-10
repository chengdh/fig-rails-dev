#coding: utf-8
#县局劳务-工资表
class SalaryTableXianNonStaff < SalaryTable
  #获取对应的工资模板
  def self.get_salary_item_header
    ret = SalaryItemHeader.find_by(code: SalaryItemHeader::CODE_XIAN_NON_STAFF)
    ret
  end
end
