#coding: utf-8
class SalaryTable < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  belongs_to :salary_item_header
  validates :org_id,:name,:mth,:user_id, presence: true
  validates :pay_item_1,:pay_item_2,:pay_item_3,:pay_item_4,:pay_item_5,:pay_item_6,:pay_item_7,:pay_item_8,:pay_item_9,:pay_item_10,:pay_item_11,:pay_item_12,:pay_item_13,
    :pay_item_14,:pay_item_15,:pay_item_16,:pay_item_17,:pay_item_18,:pay_item_19,:pay_item_20,:pay_item_21,:pay_item_22,:pay_item_23,:pay_item_24,:pay_item_25,:pay_item_26,
    :pay_item_27,:pay_item_28,:pay_item_29,:pay_item_30,:pay_item_31,:pay_item_32,:pay_item_33,:pay_item_34,:pay_item_35,:pay_item_36,:pay_item_37,:pay_item_38,:pay_item_39,
    :deduct_item_1,:deduct_item_2,:deduct_item_3,:deduct_item_4,:deduct_item_5,:deduct_item_6,:deduct_item_7,:deduct_item_8,:deduct_item_9,:deduct_item_10,:deduct_item_11,:deduct_item_12,:deduct_item_13,
    :deduct_item_14,:deduct_item_15,:deduct_item_16,:deduct_item_17,:deduct_item_18,:deduct_item_19,:deduct_item_20,:deduct_item_21,:deduct_item_22,:deduct_item_23,:deduct_item_24,:deduct_item_25,:deduct_item_26,
    :deduct_item_27,:deduct_item_28,:deduct_item_29,:deduct_item_30,:deduct_item_31,:deduct_item_32,:deduct_item_33,:deduct_item_34,:deduct_item_35,:deduct_item_36,:deduct_item_37,:deduct_item_38,:deduct_item_39,
    numericality: {only_integer: true, greater_than_or_equal_to: 0}
  has_many :salary_table_lines,dependent: :destroy
  accepts_nested_attributes_for :salary_table_lines

  #根据传入的参数生成工资表
  #org_id 机构
  #月份
  #work_state 人员属性
  #template_id 工资模板id
  def self.new_with_params(options)
    table = SalaryTable.find_by(options)
    return table if table.present?
    org = Org.find(options[:org_id])
    salary_item_header = SalaryItemHeader.find(options[:salary_item_header_id])
    table = SalaryTable.new(options)
    table.name = "#{org}-#{options[:mth]}-#{salary_item_header.name}"
    employee_where_hash = salary_item_header.employee_where
    #Employee.where(org_id: options[:org_id],is_active: true).where(employee_where_hash).each do |e|
    Employee.where(org_id: options[:org_id],is_active: true).each do |e|
      table.salary_table_lines.build(employee: e)
    end
    table
  end

  #GET salary_tables/show_import_xls
  #显示导入窗口
  def show_import_xls
    render partial: "show_import_xls"
  end

  #从excel模板中导入工资表
  def self.create_with_excel(org_id,mth,excel_file,user_id)
    table = SalaryTable.new(org_id: org_id,mth: mth)
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
end
