#coding: utf-8
#工资表-市局劳务
class SalaryTableShiNonStaff < SalaryTable
  #获取对应的工资模板
  def self.get_salary_item_header
    ret = SalaryItemHeader.find_by(code: SalaryItemHeader::CODE_SHI_NON_STAFF)
    ret
  end
end
