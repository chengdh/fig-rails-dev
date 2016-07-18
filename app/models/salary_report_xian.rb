#coding: utf-8
#县级工资汇总表
class SalaryReportXian < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  has_many :salary_report_xian_lines,dependent: :destroy
  validates :name,:year,:org_id, presence: true
  default_value_for :table_date do
    Date.today
  end

  #应发合计
  def sum_should_pay_group_by(conditions={})
    salary_report_xian_lines.where(conditions).sum("mth_1st_shoud_pay+mth_2st_shoud_pay+mth_3st_shoud_pay+mth_4st_shoud_pay"+
                                                  "+mth_5st_shoud_pay+mth_6st_shoud_pay+mth_7st_shoud_pay+mth_8st_shoud_pay" +
                                                  "+mth_9st_shoud_pay+mth_10st_shoud_pay+mth_11st_shoud_pay+mth_12st_shoud_pay" +
                                                  "+mth_13st_shoud_pay")
  end
  #实发合计
  def sum_act_pay_group_by(conditions={})
    salary_report_xian_lines.where(conditions).sum("mth_1st_act_pay+mth_2st_act_pay+mth_3st_act_pay+mth_4st_act_pay"+
                                                  "+mth_5st_act_pay+mth_6st_act_pay+mth_7st_act_pay+mth_8st_act_pay" +
                                                  "+mth_9st_act_pay+mth_10st_act_pay+mth_11st_act_pay+mth_12st_act_pay" +
                                                  "+mth_13st_act_pay")


  end
  #人数合计(取13个月的平均数
  def average_persons_group_by(conditions={})
    ret = salary_report_xian_lines.where(conditions).sum("mth_1st_persons+mth_2st_persons+mth_3st_persons+mth_4st_persons"+
                                                        "+mth_5st_persons+mth_6st_persons+mth_7st_persons+mth_8st_persons" +
                                                        "+mth_9st_persons+mth_10st_persons+mth_11st_persons+mth_12st_persons" +
                                                        "+mth_13st_persons")/13
    ret = ret.round(0)
    ret
  end

  #人均收入
  def avg_income(conditions={})
    return 0 if average_persons_group_by(conditions) == 0.0
    sum_should_pay_group_by(conditions).to_f/average_persons_group_by(conditions).to_f
  end


  #生成父机构报表数据
  def self.batch_generate_data_by_parent
    mth = Date.today.last_month.strftime("%Y%m")
    self.generate_data_by_parent_org(Org.root_org_id,mth)
  end
  #生成市级的报表
  def self.generate_data_by_parent_org(parent_org_id,mth)
    org = Org.find(parent_org_id)
    #child_org_ids = Org.where(is_active: true,parent_id: parent_org_id).pluck(:id)
    child_org_ids = Org.get_branch_ids
    year = mth[0..3].to_i
    the_mth = mth[4..5]
    report = self.find_by(org_id: parent_org_id,year: year)
    if report.blank?
      report = self.create!(org_id: parent_org_id,year: year,name: "#{org}-#{year}-工资总额使用情况(县局及中心)")
    end
    #在岗-领导
    work_state = Employee::WORK_STATE_ON_DUTY
    post_level = 1
    self.update_or_create_report_line(report,SalaryTableXianLeader,child_org_ids,mth,work_state,post_level)

    #在岗
    [Employee::WORK_STATE_ON_DUTY].each do |ws|
      [6,7,9].each do |pl|
        [false,true].each do |not_main|
          self.update_or_create_report_line(report,SalaryTableXianOnDuty,child_org_ids,mth,ws,pl,not_main)
        end
      end
    end

    #内退
    [Employee::WORK_STATE_RETIRED].each do |ws|
      [6,7,9].each do |pl|
        [false,true].each do |not_main|
          self.update_or_create_report_line(report,SalaryTableXianRetired,child_org_ids,mth,ws,pl,not_main)
        end
      end
    end

    #劳务
    [Employee::WORK_STATE_NON_STAFF].each do |ws|
      self.update_or_create_report_line(report,SalaryTableXianNonStaff,child_org_ids,mth,ws)
    end
  end

  #自动生成各个县局的报表数据
  def self.batch_generate_data
    mth = Date.today.last_month.strftime("%Y%m")
    org_ids = Org.get_branch_ids
    org_ids.each {|id| self.generate_data(id,mth)}
  end
  #
  #生成汇总表数据
  def self.generate_data(org_id,mth)
    org = Org.find(org_id)
    year = mth[0..3].to_i
    the_mth = mth[4..5]
    report = self.find_by(org_id: org_id,year: year)
    if report.blank?
      report = self.create!(org_id: org_id,year: year,name: "#{org}-#{year}-工资总额使用情况(县局及中心)")
    end


    #在岗-领导
    work_state = Employee::WORK_STATE_ON_DUTY
    post_level = 1
    self.update_or_create_report_line(report,SalaryTableXianLeader,org_id,mth,work_state,post_level)

    #在岗
    [Employee::WORK_STATE_ON_DUTY].each do |ws|
      [6,7,9].each do |pl|
        [false,true].each do |not_main|
          self.update_or_create_report_line(report,SalaryTableXianOnDuty,org_id,mth,ws,pl,not_main)
        end
      end
    end

    #内退
    [Employee::WORK_STATE_RETIRED].each do |ws|
      [6,7,9].each do |pl|
        [false,true].each do |not_main|
          self.update_or_create_report_line(report,SalaryTableXianRetired,org_id,mth,ws,pl,not_main)
        end
      end
    end

    #劳务
    [Employee::WORK_STATE_NON_STAFF].each do |ws|
      self.update_or_create_report_line(report,SalaryTableXianNonStaff,org_id,mth,ws)
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
      table_lines = salary_table.try(:salary_table_lines)
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
