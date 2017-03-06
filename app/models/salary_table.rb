#coding: utf-8
class SalaryTable < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  belongs_to :salary_item_header
  validates :org_id,:name,:mth,:user_id, presence: true
  has_many :salary_table_lines,dependent: :destroy,autosave: true
  accepts_nested_attributes_for :salary_table_lines

  def self.new_by_dup(dup_salary_table)
    table = dup_salary_table.dup
    dup_salary_table.salary_table_lines.each do |tl|
      table.salary_table_lines << tl.dup
    end
    table
  end
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
    org_ids = [options[:org_id]]
    org = Org.find(options[:org_id])
    # org.get_all_children_ids(org_ids)
    org_ids += org.children.map {|c| c.id}

    Employee.where(org_id: org_ids,is_active: true).where(employee_where_hash).each do |e|
    #Employee.where(org_id: options[:org_id],is_active: true).each do |e|
      table.salary_table_lines.build(employee: e,
                                     name: e.name,
                                     id_no: e.id_no,
                                     org_id: e.org_id,
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
    table.salary_item_header = get_salary_item_header
    xls_doc = Roo::Spreadsheet.open(excel_file)
    table_name = xls_doc.row(2)[0]
    table.name = table_name
    table.name = "#{table.org}-#{mth}-#{table.salary_item_header.name}" if table_name.blank?
    #获取表头对应字段
    header_row = xls_doc.row(1)
    id_no_index = header_row.index("id_no")
    return nil if id_no_index.blank?
    #自第五行导入
    (5..xls_doc.last_row).each do |ix|
      row = xls_doc.row(ix)
      #以身份证号为对比条件
      id_no = row[id_no_index]
      employee = Employee.find_by(id_no: id_no)
      if id_no.present? and employee.present?
        table_line = SalaryTableLine.new
        table_line.employee = employee
        table_line.org_id = employee.org_id
        header_row.each_with_index do |col,col_idx|
          table_line.try("#{col}=".to_sym,row[col_idx]) if col.present?
        end
        table.salary_table_lines << table_line
      end
    end
    table.save!
    table
  end

  #自excel更新已有的工资表
  def self.update_with_excel(org_id,mth,excel_file,user_id)
    table = self.find_by(org_id: org_id,mth: mth)
    return nil if table.blank?
    table.user_id = user_id
    table.salary_item_header = get_salary_item_header
    xls_doc = Roo::Spreadsheet.open(excel_file)
    table_name = xls_doc.row(2)[0]
    table.name = table_name
    table.name = "#{table.org}-#{mth}-#{table.salary_item_header.name}" if table_name.blank?
    #获取表头对应字段
    header_row = xls_doc.row(1)
    id_no_index = header_row.index("id_no")
    return nil if id_no_index.blank?
    #自第五行导入
    (5..xls_doc.last_row).each do |ix|
      row = xls_doc.row(ix)
      #以身份证号为对比条件
      id_no = row[id_no_index]
      employee = Employee.find_by(id_no: id_no)
      if id_no.present? and employee.present?
        table_line = table.salary_table_lines.find_by(employee_id: employee.id)
        if table_line.present?
          table_line.org_id = employee.org_id
          header_row.each_with_index do |col,col_idx|
            table_line.try("#{col}=".to_sym,row[col_idx]) if col.present?
          end
          table_line.save!
        end
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
