#coding: utf-8
#领导干部薪酬发放统计台帐
class SalaryReportLeader < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  has_many :salary_report_leader_lines,dependent: :destroy
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
    ret = salary_report_leader_lines.sum(exp_array.join("+"))
    ret
  end
  def cal_sum_by_mth(mth,exp)
    ret = 0
    cols = exp.split("+")
    exp_array = cols.map {|c| "mth_#{mth}st_#{c.strip}"}
    ret = salary_report_leader_lines.sum(exp_array.join("+"))
    ret
  end

  #父机构生成数据
  def self.generate_data_by_parent_org(parent_org_id,mth)
    org = Org.find(org_id)
    child_org_ids = Org.where(is_active: true,parent_id: parent_org_id).pluck(:id)
    year = mth[0..3].to_i
    the_mth = mth[4..5]
    report = self.find_by(org_id: org_id,year: year)
    if report.blank?
      report = self.create!(org_id: org_id,
                            year: year,
                            table_date: Date.today,
                            name: "#{org}-#{year}-领导干部薪酬发放统计台账")
    end
    #县领导工资表
    salary_tables = SalaryReportXianLeader.where(org_id: child_org_ids,mth: mth)
    return if salary_tables.blank?
    salary_tables.each do |st|
      st.salary_table_lines.each do |l|
        employee = l.employee
        report_line = report.salary_report_leader_lines.find_by(employee_id: l.employee_id)
        if report_line.blank?
          report_line = SalaryReportLeaderLine.create!(salary_report_leader: report,
                                                       employee: employee,
                                                       name: l.name, 
                                                       id_no: l.id_no,
                                                       post: l.post,
                                                       post_level: l.post_level,
                                                       is_party_member: l.is_party_member,
                                                       belongs_party: l.belongs_party,
                                                       is_not_main: l.is_not_main
                                                      )
        end

        #更新对应的数据
        up_attrs = {}
        (1..20).each do |i|
          col_name = "mth_#{the_mth}st_pay_item_#{i}".to_sym
          up_attrs["mth_#{the_mth}st_pay_item_#{i}".to_sym] = l.send("pay_item_#{i}".to_sym)
          up_attrs["mth_#{the_mth}st_deduct_item_#{i}".to_sym] = l.send("deduct_item_#{i}".to_sym)
        end
        report_line.update_attributes(up_attrs)
      end
    end
  end
  #生成单月数据
  def self.generate_data(org_id,mth)
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
    salary_table = SalaryTableXianLeader.find_by(org_id,mth: mth)
    return if salary_table.blank?
    salary_table.salary_table_lines.each do |l|
      employee = l.employee
      report_line = report.salary_report_leader_lines.find_by(employee_id: l.employee_id)
      if report_line.blank?
        report_line = SalaryReportLeaderLine.create!(salary_report_leader: report,
                                                     employee: employee,
                                                     name: l.name, 
                                                     id_no: l.id_no,
                                                     post: l.post,
                                                     post_level: l.post_level,
                                                     is_party_member: l.is_party_member,
                                                     belongs_party: l.belongs_party,
                                                     is_not_main: l.is_not_main
                                                    )
      end

      #更新对应的数据
      up_attrs = {}
      (1..20).each do |i|
        col_name = "mth_#{the_mth}st_pay_item_#{i}".to_sym
        up_attrs["mth_#{the_mth}st_pay_item_#{i}".to_sym] = l.send("pay_item_#{i}".to_sym)
        up_attrs["mth_#{the_mth}st_deduct_item_#{i}".to_sym] = l.send("deduct_item_#{i}".to_sym)
      end
      report_line.update_attributes(up_attrs)
    end
  end

  private
  #获取单月数据
  #org_id 机构
  #mth 月份
  #conditions 查询条件
  def self.update_or_create_report_line(report,salary_table_clazz,org_id,mth,work_state,post_level=nil,is_not_main=nil)
    conditions = {
      work_state: work_state,
      post_level: post_level,
      is_not_main: is_not_main
    }
    conditions.delete_if { |key, value| value.blank? }
    table_line_conditions =  conditions.except(:work_state)

    year = mth[0..3].to_i
    the_mth = mth[4..5].to_i

    #获取对应的模板
    sih = salary_table_clazz.get_salary_item_header
    col_should_pay  = sih.salary_items.find_by(name: "应发合计").code.to_sym
    col_act_pay  = sih.salary_items.find_by(name: "实发合计").code.to_sym


    table_lines = nil
    #判断传入的是数组还是单个id
    if org_id.kind_of?(Array)
      table_ids = salary_table_clazz.where(org_id: org_id,mth: mth).pluck(:id)
      table_lines = SalaryTableLine.where(salary_table_id: table_ids)
    else
      salary_table = salary_table_clazz.find_by(org_id: org_id,mth: mth)
      table_lines = salary_table.salary_table_lines
    end
    sum_persons = 0
    sum_should_pay = 0
    sum_act_pay = 0


    if table_lines.present?
      #人数
      sum_persons = table_lines.where(table_line_conditions).sum(1)
      sum_should_pay = table_lines.where(table_line_conditions).sum(col_should_pay)
      sum_act_pay = table_lines.where(table_line_conditions).sum(col_act_pay)
    end

    report_line = report.salary_report_xian_lines.find_by(conditions)

    if report_line.blank?
      SalaryReportXianLine.create!(
        conditions.merge(
          salary_report_xian: report,
          "mth_#{the_mth}st_persons" => sum_persons,
          "mth_#{the_mth}st_shoud_pay" => sum_should_pay,
          "mth_#{the_mth}st_act_pay" => sum_act_pay
        )
      )
    else
      report_line = SalaryReportXianLine.find(report_line.id)
      report_line.update_attributes("mth_#{the_mth}st_persons" =>  sum_persons,
                                    "mth_#{the_mth}st_shoud_pay" =>  sum_should_pay,
                                    "mth_#{the_mth}st_act_pay" =>  sum_act_pay
                                   )
    end
    report_line
  end

end
