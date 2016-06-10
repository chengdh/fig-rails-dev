#coding: utf-8
#县局领导-工资表
class SalaryTableXianLeader < SalaryTable
  #获取对应的工资模板
  def self.get_salary_item_header
    ret = SalaryItemHeader.find_by(code: SalaryItemHeader::CODE_XIAN_LEADER)
    ret
  end
end
