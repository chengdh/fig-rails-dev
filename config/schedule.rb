# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end
# 每月3号生成安保考核数据
every "30 1 3 * * " do
  runner  "Assessment.batch_auto_generate"
end
# 每月20号生成
# 市局机关-工资总额使用情况
every "30 2 20 * * " do
  runner  "SalaryReportShi.batch_generate_data"
end

# 县局及中心-工资总额使用情况(市级查看)
every "30 2 20 * * " do
  runner  "SalaryReportXian.batch_generate_data_by_parent"
end

# 县局及中心-工资总额使用情况(各个县局)
every "30 2 20 * * " do
  runner  "SalaryReportXian.batch_generate_data"
end

# 领导干部薪酬发放统计台帐
every "30 2 20 * * " do
  runner  "SalaryReportLeader.batch_generate(SalaryTableXianLeader)"
end


# 在岗员工收入统计台站
every "30 2 20 * * " do
  runner  "SalaryReportOnDutyEmployee.batch_generate(SalaryTableXianOnDuty)"
end


# 内退人员生活费收入台帐
every "30 2 20 * * " do
  runner  "SalaryReportRetired.batch_generate(SalaryTableXianRetired)"
end


# 劳务人员工资收入台帐
every "30 2 20 * * " do
  runner  "SalaryReportNonStaff.batch_generate(SalaryTableXianNonStaff)"
end


# Learn more: http://github.com/javan/whenever
