#coding: utf-8
#工资汇总表基础类
class BaseSalaryReport < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  has_many :salary_report_lines,dependent: :destroy
  validates :name,:year,:org_id, presence: true
  default_value_for :table_date do
    Date.today
  end
  #根据表达式计算合计
  def cal_sum(exp)
    ret = 0
    exp_array = []
    cols = exp.split("+")
    cols.each do |c|
      (1..13).each do |mth|
        exp_array.append("mth_#{mth}st_#{c.strip}")
      end
    end
    ret = salary_report_lines.sum(exp_array.join("+"))
    ret
  end
  #计算单月合计
  def cal_sum_by_mth(mth,exp)
    ret = 0
    cols = exp.split("+")
    exp_array = cols.map { |c| "mth_#{mth}st_#{c.strip}"}
    ret = salary_report_lines.sum(exp_array.join("+"))
    ret
  end

  #父机构生成数据
  def self.generate_data_by_parent_org(salary_table_clazz,parent_org_id,mth)
    org = Org.find(org_id)
    child_org_ids = Org.where(is_active: true,parent_id: parent_org_id).pluck(:id)
    year = mth[0..3].to_i
    the_mth = mth[4..5]
    report = self.find_by(org_id: org_id,year: year)
    if report.blank?
      report = self.create!(org_id: org_id,
                            year: year,
                            table_date: Date.today,
                            name: "#{org}-#{year}-薪酬发放统计台账")
    end
    #县领导工资表
    salary_tables = salary_table_clazz.where(org_id: child_org_ids,mth: mth)
    return if salary_tables.blank?
    salary_tables.each do |st|
      st.salary_table_lines.each do |l|
        employee = l.employee
        report_line = report.salary_report_lines.find_by(employee_id: l.employee_id)
        if report_line.blank?
          report_line = SalaryReportLine.create!(base_salary_report: report,
                                                 employee: l.employee,
                                                 name: l.name,
                                                 id_no: l.id_no,
                                                 post: l.post,
                                                 post_level: l.post_level,
                                                 is_party_member: l.is_party_member,
                                                 is_not_main: l.is_not_main,
                                                 belongs_party: l.belongs_party,
                                                 grant_rate: l.grant_rate,
                                                 wage_before_last: l.wage_before_last,
                                                 wage_last: l.wage_last,
                                                 mth_pref_base: l.mth_pref_base,
                                                 year_pref_base: l.year_pref_base,
                                                 pref_rate: l.pref_rate,
                                                 living_base: l.living_base,
                                                 living_salary_rate: l.living_salary_rate
                                                )
        end

        #更新对应的数据
        up_attrs = {}
        (1..20).each do |i|
          up_attrs["mth_#{the_mth}st_pay_item_#{i}".to_sym] = l.send("pay_item_#{i}".to_sym)
          up_attrs["mth_#{the_mth}st_deduct_item_#{i}".to_sym] = l.send("deduct_item_#{i}".to_sym)
        end
        up_attrs["mth_#{the_mth}st_basic_salary".to_sym] = l.basic_salary
        up_attrs["mth_#{the_mth}st_pref_salary".to_sym] = l.pref_salary
        up_attrs["mth_#{the_mth}st_post_salary".to_sym] = l.post_salary
        up_attrs["mth_#{the_mth}st_living_salary".to_sym] = l.living_salary
        report_line.update_attributes(up_attrs)
      end
    end
  end
  #生成单月数据
  def self.generate_data(salary_table_class,org_id,mth)
    org = Org.find(org_id)
    year = mth[0..3].to_i
    the_mth = mth[4..5].to_i
    report = self.find_by(org_id: org_id,year: year)
    if report.blank?
      report = self.create!(org_id: org_id,
                            year: year,
                            table_date: Date.today,
                            name: "#{org}-#{year}-领导干部薪酬发放统计台账")
    end
    #县领导工资表
    salary_table = salary_table_class.find_by(org_id,mth: mth)
    return if salary_table.blank?
    salary_table.salary_table_lines.each do |l|
      employee = l.employee
      report_line = report.salary_report_lines.find_by(employee_id: l.employee_id)
      if report_line.blank?
        report_line = SalaryReportLine.create!(base_salary_report: report,
                                                     employee: l.employee,
                                                     name: l.name,
                                                     id_no: l.id_no,
                                                     post: l.post,
                                                     post_level: l.post_level,
                                                     is_party_member: l.is_party_member,
                                                     is_not_main: l.is_not_main,
                                                     belongs_party: l.belongs_party,
                                                     grant_rate: l.grant_rate,
                                                     wage_before_last: l.wage_before_last,
                                                     wage_last: l.wage_last,
                                                     mth_pref_base: l.mth_pref_base,
                                                     year_pref_base: l.year_pref_base,
                                                     pref_rate: l.pref_rate,
                                                     living_base: l.living_base,
                                                     living_salary_rate: l.living_salary_rate
                                                    )
      end

      #更新对应的数据
      up_attrs = {}
      (1..20).each do |i|
        up_attrs["mth_#{the_mth}st_pay_item_#{i}".to_sym] = l.send("pay_item_#{i}".to_sym)
        up_attrs["mth_#{the_mth}st_deduct_item_#{i}".to_sym] = l.send("deduct_item_#{i}".to_sym)
      end
      up_attrs["mth_#{the_mth}st_basic_salary".to_sym] = l.basic_salary
      up_attrs["mth_#{the_mth}st_pref_salary".to_sym] = l.pref_salary
      up_attrs["mth_#{the_mth}st_post_salary".to_sym] = l.post_salary
      up_attrs["mth_#{the_mth}st_living_salary".to_sym] = l.living_salary

      report_line.update_attributes(up_attrs)
    end
  end
end
