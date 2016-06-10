#coding: utf-8
#工资表-市局领导
class SalaryTableShiLeader < SalaryTable
  #获取对应的工资模板
  def self.get_salary_item_header
    ret = SalaryItemHeader.find_by(code: SalaryItemHeader::CODE_SHI_LEADER)
    ret
  end

end
