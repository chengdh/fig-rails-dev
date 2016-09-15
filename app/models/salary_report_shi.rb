#coding: utf-8
class SalaryReportShi < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  has_many :salary_report_shi_lines,dependent: :destroy
  validates :name,:year,:org_id, presence: true
  default_value_for :table_date do
    Date.today
  end

  #应发合计
  def sum_should_pay
    salary_report_shi_lines.sum("mth_1st_shoud_pay+mth_2st_shoud_pay+mth_3st_shoud_pay+mth_4st_shoud_pay"+
                                "+mth_5st_shoud_pay+mth_6st_shoud_pay+mth_7st_shoud_pay+mth_8st_shoud_pay" +
                                "+mth_9st_shoud_pay+mth_10st_shoud_pay+mth_11st_shoud_pay+mth_12st_shoud_pay" +
                                "+mth_13st_shoud_pay")

  end
  #实发合计
  def sum_act_pay
    salary_report_shi_lines.sum("mth_1st_act_pay+mth_2st_act_pay+mth_3st_act_pay+mth_4st_act_pay"+
                                "+mth_5st_act_pay+mth_6st_act_pay+mth_7st_act_pay+mth_8st_act_pay" +
                                "+mth_9st_act_pay+mth_10st_act_pay+mth_11st_act_pay+mth_12st_act_pay" +
                                "+mth_13st_act_pay")
  end
  #人数合计(取13个月的平均数)
  def average_persons
    salary_report_shi_lines.average("mth_1st_persons+mth_2st_persons+mth_3st_persons+mth_4st_persons"+
                                    "+mth_5st_persons+mth_6st_persons+mth_7st_persons+mth_8st_persons" +
                                    "+mth_9st_persons+mth_10st_persons+mth_11st_persons+mth_12st_persons" +
                                    "+mth_13st_persons")
  end

  #应发合计
  def sum_should_pay_group_by(conditions={})
    salary_report_shi_lines.where(conditions).sum("mth_1st_shoud_pay+mth_2st_shoud_pay+mth_3st_shoud_pay+mth_4st_shoud_pay"+
                                                  "+mth_5st_shoud_pay+mth_6st_shoud_pay+mth_7st_shoud_pay+mth_8st_shoud_pay" +
                                                  "+mth_9st_shoud_pay+mth_10st_shoud_pay+mth_11st_shoud_pay+mth_12st_shoud_pay" +
                                                  "+mth_13st_shoud_pay")
  end
  #实发合计
  def sum_act_pay_group_by(conditions={})
    salary_report_shi_lines.where(conditions).sum("mth_1st_act_pay+mth_2st_act_pay+mth_3st_act_pay+mth_4st_act_pay"+
                                                  "+mth_5st_act_pay+mth_6st_act_pay+mth_7st_act_pay+mth_8st_act_pay" +
                                                  "+mth_9st_act_pay+mth_10st_act_pay+mth_11st_act_pay+mth_12st_act_pay" +
                                                  "+mth_13st_act_pay")


  end
  #人数合计-取到当前月的平均数
  def average_persons_group_by(conditions={})
    cur_mth = Date.today.month
    ret = salary_report_shi_lines.where(conditions).sum("mth_1st_persons+mth_2st_persons+mth_3st_persons+mth_4st_persons"+
                                                        "+mth_5st_persons+mth_6st_persons+mth_7st_persons+mth_8st_persons" +
                                                        "+mth_9st_persons+mth_10st_persons+mth_11st_persons+mth_12st_persons")/cur_mth
    ret = ret.round(0)
    ret
  end

  #人均收入
  def avg_income(conditions={})
    return 0 if average_persons_group_by(conditions) == 0.0
    sum_should_pay_group_by(conditions).to_f/average_persons_group_by(conditions).to_f
  end


  #自动生成上月工资汇总表
  def self.batch_generate_data
    mth = Date.today.last_month.strftime("%Y%m")
    org_id = Org.find_by(name: "南阳市烟草专卖局").id
    self.generate_data(org_id,mth)

  end
  #生成汇总表数据
  def self.generate_data(org_id,mth)
    org = Org.find(org_id)
    year = mth[0..3].to_i
    the_mth = mth[4..5]
    report = self.find_by(org_id: org_id,year: year)
    if report.blank?
      report = self.create!(org_id: org_id,year: year,name: "#{org}-#{year}-工资总额使用情况(市局机关)")
    end


    #在岗-领导
    work_state = Employee::WORK_STATE_ON_DUTY
    post_level = 1
    self.update_or_create_report_line(report,SalaryTableShiLeader,org_id,mth,work_state,post_level)

    #---------------------------------------
    #在岗-正科
    post_level = 2
    self.update_or_create_report_line(report,SalaryTableShiOnDuty,org_id,mth,work_state,post_level)


    #在岗-正协
    post_level = 3
    self.update_or_create_report_line(report,SalaryTableShiOnDuty,org_id,mth,work_state,post_level)

    #在岗-副科
    post_level = 4
    self.update_or_create_report_line(report,SalaryTableShiOnDuty,org_id,mth,work_state,post_level)

    #在岗-副协
    post_level = 5
    self.update_or_create_report_line(report,SalaryTableShiOnDuty,org_id,mth,work_state,post_level)


    #在岗-一般人员
    post_level = 9
    self.update_or_create_report_line(report,SalaryTableShiOnDuty,org_id,mth,work_state,post_level)

    #---------------------------------------
    #编外离岗-正科
    work_state = Employee::WORK_STATE_NON_STAFF
    post_level = 2
    self.update_or_create_report_line(report,SalaryTableShiNonStaff,org_id,mth,work_state,post_level)

    #编外离岗-正协
    post_level = 3
    self.update_or_create_report_line(report,SalaryTableShiNonStaff,org_id,mth,work_state,post_level)

    #编外离岗-副科
    post_level = 4
    self.update_or_create_report_line(report,SalaryTableShiNonStaff,org_id,mth,work_state,post_level)


    #编外离岗-副协
    post_level = 5
    self.update_or_create_report_line(report,SalaryTableShiNonStaff,org_id,mth,work_state,post_level)

    #编外离岗-一般人员
    post_level = 9
    self.update_or_create_report_line(report,SalaryTableShiNonStaff,org_id,mth,work_state,post_level)

    #---------------------------------------
    #内退-正科
    work_state = Employee::WORK_STATE_RETIRED
    post_level = 2
    self.update_or_create_report_line(report,SalaryTableShiNonStaff,org_id,mth,work_state,post_level)

    #内退-正协
    post_level = 3
    self.update_or_create_report_line(report,SalaryTableShiNonStaff,org_id,mth,work_state,post_level)


    #内退-副科
    post_level = 4
    self.update_or_create_report_line(report,SalaryTableShiNonStaff,org_id,mth,work_state,post_level)


    #内退-副协
    post_level = 5
    self.update_or_create_report_line(report,SalaryTableShiNonStaff,org_id,mth,work_state,post_level)

    #内退-一般人员
    post_level = 9
    self.update_or_create_report_line(report,SalaryTableShiNonStaff,org_id,mth,work_state,post_level)
  end

  private
  #获取单月数据
  #org_id 机构
  #mth 月份
  #conditions 查询条件
  def self.update_or_create_report_line(report,salary_table_clazz,org_id,mth,work_state,post_level)
    conditions = {} if conditions.blank?
    year = mth[0..3].to_i
    the_mth = mth[4..5].to_i

    #获取对应的模板
    sih = salary_table_clazz.get_salary_item_header
    col_should_pay  = sih.salary_items.find_by(name: "应发合计").code.to_sym
    col_act_pay  = sih.salary_items.find_by(name: "实发合计").code.to_sym
    salary_table = salary_table_clazz.find_by(org_id: org_id,mth: mth)
    sum_persons = 0
    sum_should_pay = 0
    sum_act_pay = 0


    if salary_table.present?
      lines = salary_table.salary_table_lines.search(employee_work_state_eq: work_state,employee_post_level_eq: post_level).result
      #人数
      sum_persons = lines.sum(1)
      sum_should_pay = lines.sum(col_should_pay)
      sum_act_pay = lines.sum(col_act_pay)
    end

    report_line = report.salary_report_shi_lines.find_by(work_state: work_state,post_level: post_level)

    if report_line.blank?
      SalaryReportShiLine.create!(salary_report_shi: report,
                          work_state: work_state,
                          post_level: post_level,
                          "mth_#{the_mth}st_persons" => sum_persons,
                          "mth_#{the_mth}st_shoud_pay" => sum_should_pay,
                          "mth_#{the_mth}st_act_pay" => sum_act_pay
                         )
    else

      report_line = SalaryReportShiLine.find(report_line.id)
      report_line.update_attributes("mth_#{the_mth}st_persons" => sum_persons,
                                    "mth_#{the_mth}st_shoud_pay" => sum_should_pay,
                                    "mth_#{the_mth}st_act_pay" => sum_act_pay
                                   )
    end
    report_line
  end
end
