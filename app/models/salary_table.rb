#coding: utf-8
class SalaryTable < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  belongs_to :salary_item_header
  validates :org_id,:name,:mth,:user_id, presence: true
  has_many :salary_table_lines,dependent: :destroy
  accepts_nested_attributes_for :salary_table_lines

  #根据传入的参数生成工资表
  #org_id 机构
  #月份
  #work_state 人员属性
  #template_id 工资模板id
  def self.new_with_params(options)
    table = self.find_by(options)
    return table if table.present?
    org = Org.find(options[:org_id])
    sih = self.get_salary_item_header()
    table = self.new(options)
    table.salary_item_header = sih
    table.name = "#{org}-#{options[:mth]}-#{sih.name}"
    employee_where_hash = sih.employee_where
    Employee.where(org_id: options[:org_id],is_active: true).where(employee_where_hash).each do |e|
    #Employee.where(org_id: options[:org_id],is_active: true).each do |e|
      table.salary_table_lines.build(employee: e,
                                     name: e.name,
                                     id_no: e.id_no,
                                     post: e.post,
                                     post_level: e.post_level,
                                     is_party_member: e.is_party_member,
                                     is_not_main: e.is_not_main,
                                     belongs_party: e.belongs_party,
                                     grant_rate: e.grant_rate,
                                     wage_before_last: e.wage_before_last,
                                     wage_last: e.wage_last,
                                     basic_salary: e.basic_salary,
                                     pref_salary: e.pref_salary,
                                     mth_pref_base: e.mth_pref_base,
                                     year_pref_base: e.year_pref_base,
                                     pref_rate: e.pref_rate,
                                     post_salary: e.post_salary,
                                     living_base: e.living_base,
                                     living_salary_rate: e.living_salary_rate,
                                     living_salary: e.living_salary
                                    )
    end
    table
  end

  #从excel模板中导入工资表
  def self.create_with_excel(org_id,mth,excel_file,user_id)
    table = self.new(org_id: org_id,mth: mth)
    table.user_id = user_id
    xls_doc = Roo::Spreadsheet.open(excel_file)
    table.name = xls_doc.row(1)[0]
    #逐行导入
    (4..xls_doc.last_row).each do |ix|
      row = xls_doc.row(ix)
      employee_name = row[1]
      employee = Employee.find_by_name(employee_name)
      if employee.present?
        table_line = SalaryTableLine.new
        table_line.employee = employee
        #计算收入列(10列)
        (1..10).each {|i| table_line.send("pay_item_#{i}=".to_sym,row[1+i])}
        #计算支出列
        (11..25).each {|j| table_line.send("deduct_item_#{j}=".to_sym,row[1+j])}
        #实发合计
        table_line.pay_item_26 = row[27]
        table.salary_table_lines << table_line
      end
    end
    table.save!
    table
  end

  #获取对应的工资模板
  def self.get_salary_item_header
    ret = SalaryItemHeader.find_by(code: SalaryItemHeader::CODE_XIAN_LEADER)
    ret
  end
end
