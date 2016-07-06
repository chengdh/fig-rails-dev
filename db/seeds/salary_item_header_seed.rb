#默认工资表项目
SalaryItemHeader.destroy_all
# default_salary_item_header = SalaryItemHeader.new(name: "默认工资表")
# default_salary_item_header.save!
#
# pay_items = %w(岗位工资 绩效工资 独生子女补助 目标管理奖 绩效考核奖 旺季补贴 补充医疗 年终奖 其它)
# deduct_items = %w(养老保险 医疗保险 大病救助 失业保险 住房公积金 企业年金 工资扣个税 目标管理奖扣个税 绩效考核奖扣个税 旺季补贴扣个税 补充医疗扣个税 年终奖扣个税 其它扣个税 水电费)
# pay_items.each_with_index do |item,idx|
#   default_salary_item_header.salary_items.create(name: item,code: "pay_item_#{idx + 1}",order_by: idx+1,item_type: "pay_item")
# end
# #应发合计
# default_salary_item_header.salary_items.create(name: "应发合计",
#                                                code: "pay_item_#{default_salary_item_header.salary_items.length + 1}",
#                                                is_calculate: true,
#                                                formula: "pay_item_1 + pay_item_2 + pay_item_3 + pay_item_4 + pay_item_5 + pay_item_6 + pay_item_7 + pay_item_8 + pay_item_9",
#                                                order_by: default_salary_item_header.salary_items.length + 1,
#                                                item_type: "pay_item")
# deduct_items.each_with_index do |item,idx|
#   default_salary_item_header.salary_items.create(name: item,code: "deduct_item_#{default_salary_item_header.salary_items.length + 1}",
#                                                  order_by: default_salary_item_header.salary_items.length+1,item_type: "deduct_item")
# end
# #扣款合计
# default_salary_item_header.salary_items.create(name: "应扣合计",
#                                                code: "deduct_item_#{default_salary_item_header.salary_items.length + 1}",
#                                                 is_calculate: true,
#                                                formula: "deduct_item_1 + deduct_item_2 + deduct_item_3 + deduct_item_4 + deduct_item_5 + deduct_item_6 + deduct_item_6 + deduct_item_7 + deduct_item_8 + deduct_item_9 + deduct_item_10 + deduct_item_11 + deduct_item_12 + deduct_item_13 + deduct_item_13",
#                                                order_by: default_salary_item_header.salary_items.length + 1,
#                                                item_type: "deduct_item")
# #实发合计
# default_salary_item_header.salary_items.create(name: "实发合计",
#                                                code: "pay_item_#{default_salary_item_header.salary_items.length + 1}",
#                                                is_calculate: true,
#                                                formula: "sum_pay_item - sum_deduct_item",
#                                                order_by:  default_salary_item_header.salary_items.length + 1,
#                                                item_type: "pay_item")
#县局领导
salary_item_header = SalaryItemHeader.new(name: "工资表模板-县局领导",code: "xian_leader",employee_where: {post_level: 1,work_state: "on_duty"})
table_header = "<tr>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>序号</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>单位</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>姓名</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>身份证号</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>职务</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>职级</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>是否党员</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>所在支部</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>发放标准</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>市局核定前年薪酬</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>市局核定去年薪酬</th>
                      <th colspan='7' style='text-align : center;vertical-align : middle;'>发放项</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>应发合计</th>
                      <th colspan='12' style='text-align : center;vertical-align : middle;'>代扣代缴款项</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>扣款合计</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>实发合计</th>
                    </tr>
                    <tr>
                      <th style='text-align : center;vertical-align : middle;'>基本工资</th>
                      <th style='text-align : center;vertical-align : middle;'>绩效工资</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项１</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项２</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项３</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项４</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项５</th>
                      <th style='text-align : center;vertical-align : middle;'>养老保险</th>
                      <th style='text-align : center;vertical-align : middle;'>医疗保险</th>
                      <th style='text-align : center;vertical-align : middle;'>失业保险</th>
                      <th style='text-align : center;vertical-align : middle;'>住房公积金</th>
                      <th style='text-align : center;vertical-align : middle;'>企业年金</th>
                      <th style='text-align : center;vertical-align : middle;'>扣个税</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项１</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项２</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项３</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项４</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项５</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项６</th>
                    </tr>"
                    salary_item_header.table_header = table_header
salary_item_header.save!

employee_items = %w(单位 姓名项目	身份证号	职务	职级	是否党员	所在支部 发放标准 市局核定前年薪酬 市局核定去年薪酬 基本工资 绩效工资 )
employee_fields = %w(org name	id_no post post_level_des is_party_member_des belongs_party_des grant_rate wage_before_last wage_last basic_salary pref_salary)
employee_items.each_with_index do |item,idx|
  salary_item_header.salary_items.create!(name: item,
                                       code: "employee_item_#{salary_item_header.salary_items.where(item_type: "employee_item").length + 1}",
                                       is_calculate: true,
                                       formula: "#{employee_fields[idx]}",
                                       order_by: salary_item_header.salary_items.length + 1,
                                       item_type: "employee_item")
end

pay_items = %w(发放项１ 发放项２ 发放项３ 发放项４ 发放项５)
pay_items.each_with_index do |item,idx|
  salary_item_header.salary_items.create!(name: item,
                                          code: "pay_item_#{idx + 1}",
                                          order_by: salary_item_header.salary_items.length + 1,
                                          item_type: "pay_item")
end
#应发合计
salary_item_header.salary_items.create!(name: "应发合计",
                                               code: "pay_item_#{salary_item_header.salary_items.where(item_type: "pay_item").length + 1}",
                                               is_calculate: true,
                                               formula: "basic_salary + pref_salary + pay_item_1 + pay_item_2 + pay_item_3 + pay_item_4 + pay_item_5",
                                               order_by: salary_item_header.salary_items.length + 1,
                                               item_type: "pay_item")
deduct_items = %w(养老保险 医疗保险 失业保险 住房公积金 企业年金 扣个税 代扣项１ 代扣项２ 代扣项３ 代扣项４ 代扣项５ 代扣项６)
deduct_items.each_with_index do |item,idx|
  salary_item_header.salary_items.create!(name: item,
                                         code: "deduct_item_#{salary_item_header.salary_items.where(item_type: "deduct_item").length + 1}",
                                         order_by: salary_item_header.salary_items.length + 1,
                                         item_type: "deduct_item")
end
#扣款合计
salary_item_header.salary_items.create(name: "扣款合计",
                                       code: "deduct_item_#{salary_item_header.salary_items.where(item_type: "deduct_item").length + 1}",
                                       is_calculate: true,
                                       formula: "deduct_item_1 + deduct_item_2 + deduct_item_3 + deduct_item_4 + deduct_item_5 + deduct_item_6 + deduct_item_6 + deduct_item_7 + deduct_item_8 + deduct_item_9 + deduct_item_10 + deduct_item_11 + deduct_item_12",
                                       order_by: salary_item_header.salary_items.length + 1,
                                       item_type: "deduct_item")
#实发合计
salary_item_header.salary_items.create(name: "实发合计",
                                       code: "pay_item_#{salary_item_header.salary_items.where(item_type: "pay_item").length + 1}",
                                       is_calculate: true,
                                       formula: "basic_salary + pref_salary + pay_item_1 + pay_item_2 + pay_item_3 + pay_item_4 + pay_item_5 - deduct_item_13 ",
                                       order_by:  salary_item_header.salary_items.length + 1,
                                       item_type: "pay_item")


#县局在岗
salary_item_header = SalaryItemHeader.new(name: "工资表模板-县局在岗",code: "xian_on_duty",employee_where: {post_level: [2,3,4,5,9],work_state: "on_duty"})
table_header = "<tr>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>序号</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>单位</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>姓名</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>身份证号</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>职级</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>员工性质</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>是否党员</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>所在支部</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>月度绩效基数</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>年终奖绩效基数</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>绩效系数</th>
                      <th colspan='14' style='text-align : center;vertical-align : middle;'>发放项</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>应发合计</th>
                      <th colspan='12' style='text-align : center;vertical-align : middle;'>代扣代缴款项</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>扣款合计</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>实发合计</th>
                    </tr>
                    <tr>
                      <th style='text-align : center;vertical-align : middle;'>基本工资</th>
                      <th style='text-align : center;vertical-align : middle;'>绩效工资</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项１</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项２</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项３</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项４</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项５</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项6</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项7</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项8</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项9</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项10</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项11</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项12</th>
                      <th style='text-align : center;vertical-align : middle;'>养老保险</th>
                      <th style='text-align : center;vertical-align : middle;'>医疗保险</th>
                      <th style='text-align : center;vertical-align : middle;'>失业保险</th>
                      <th style='text-align : center;vertical-align : middle;'>住房公积金</th>
                      <th style='text-align : center;vertical-align : middle;'>企业年金</th>
                      <th style='text-align : center;vertical-align : middle;'>扣个税</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项１</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项２</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项３</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项４</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项５</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项６</th>
                    </tr>"
                    salary_item_header.table_header = table_header
salary_item_header.save!
employee_items = %w(单位 姓名项目	身份证号	职级 员工性质	是否党员	所在支部 月度绩效基数	年终奖绩效基数	绩效系数 岗位工资	绩效工资	)
employee_fields = %w(org name	id_no post_level_des is_not_main_des is_party_member_des belongs_party_des mth_pref_base year_pref_base pref_rate post_salary pref_salary)
employee_items.each_with_index do |item,idx|
  salary_item_header.salary_items.create!(name: item,
                                       code: "employee_item_#{salary_item_header.salary_items.where(item_type: "employee_item").length + 1}",
                                       is_calculate: true,
                                       formula: "#{employee_fields[idx]}",
                                       order_by: salary_item_header.salary_items.length + 1,
                                       item_type: "employee_item")
end


pay_items = %w(发放项１	发放项２	发放项３	发放项４	发放项５	发放项６	发放项７	发放项８	发放项９	发放项１０	发放项１１	发放项１２)
deduct_items = %w(养老保险 医疗保险	失业保险	住房公积金	企业年金	扣个税	代扣项1	代扣项2	代扣项3	代扣项4	代扣项5	代扣项6)
pay_items.each_with_index do |item,idx|
  salary_item_header.salary_items.create(name: item,
                                         code: "pay_item_#{idx + 1}",
                                         order_by: salary_item_header.salary_items.length + 1,
                                         item_type: "pay_item")
end
#应发合计
salary_item_header.salary_items.create(name: "应发合计",
                                       code: "pay_item_#{salary_item_header.salary_items.where(item_type: "pay_item").sum(1) + 1}",
                                       is_calculate: true,
                                       formula: "post_salary + pref_salary + pay_item_1 + pay_item_2 + pay_item_3 + pay_item_4 + pay_item_5 + pay_item_6 + pay_item_7 + pay_item_8 + pay_item_9  + pay_item_10 + pay_item_11 + pay_item_12",
                                       order_by: salary_item_header.salary_items.length + 1,
                                       item_type: "pay_item")

#扣款项
deduct_items.each_with_index do |item,idx|
  salary_item_header.salary_items.create(name: item,
                                         code: "deduct_item_#{salary_item_header.salary_items.where(item_type: "deduct_item").sum(1) + 1}",
                                         order_by: salary_item_header.salary_items.length + 1,
                                         item_type: "deduct_item")
end
#扣款合计
salary_item_header.salary_items.create(name: "扣款合计",
                                       code: "deduct_item_#{salary_item_header.salary_items.where(item_type: "deduct_item").sum(1) + 1}",
                                       is_calculate: true,
                                       formula: " deduct_item_1 + deduct_item_2 + deduct_item_3 + deduct_item_4 + deduct_item_5 + deduct_item_6 + deduct_item_6 + deduct_item_7 + deduct_item_8 + deduct_item_9 + deduct_item_10 + deduct_item_11 + deduct_item_12 ",
                                       order_by: salary_item_header.salary_items.length + 1,
                                       item_type: "deduct_item")
#实发合计
salary_item_header.salary_items.create(name: "实发合计",
                                       code: "pay_item_#{salary_item_header.salary_items.where(item_type: "pay_item").sum(1) + 1}",
                                       is_calculate: true,
                                       formula: "post_salary + pref_salary + pay_item_1 + pay_item_2 + pay_item_3 + pay_item_4 + pay_item_5 + pay_item_6 + pay_item_7 + pay_item_8 + pay_item_9  + pay_item_10 + pay_item_11 + pay_item_12 - deduct_item_13",
                                       order_by:  salary_item_header.salary_items.length + 1,
                                       item_type: "pay_item")


#县内退
salary_item_header = SalaryItemHeader.new(name: "工资表模板-县局内退",code: "xian_retired",employee_where: {work_state: "retired"})
table_header = "<tr>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>序号</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>单位</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>姓名</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>身份证号</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>原部门</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>原岗位</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>原职级</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>员工性质</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>是否党员</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>所在支部</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>生活费基数</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>生活费系数</th>
                      <th colspan='14' style='text-align : center;vertical-align : middle;'>发放项</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>应发合计</th>
                      <th colspan='12' style='text-align : center;vertical-align : middle;'>代扣代缴款项</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>扣款合计</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>实发合计</th>
                    </tr>
                    <tr>
                      <th style='text-align : center;vertical-align : middle;'>生活费</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项１</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项２</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项３</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项４</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项５</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项6</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项7</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项8</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项9</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项10</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项11</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项12</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项13</th>
                      <th style='text-align : center;vertical-align : middle;'>养老保险</th>
                      <th style='text-align : center;vertical-align : middle;'>医疗保险</th>
                      <th style='text-align : center;vertical-align : middle;'>失业保险</th>
                      <th style='text-align : center;vertical-align : middle;'>住房公积金</th>
                      <th style='text-align : center;vertical-align : middle;'>企业年金</th>
                      <th style='text-align : center;vertical-align : middle;'>扣个税</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项１</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项２</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项３</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项４</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项５</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项６</th>
                    </tr>"
                    salary_item_header.table_header = table_header
salary_item_header.save!

employee_items = %w(单位 姓名项目	身份证号 原部门 原岗位 原职级 员工性质	是否党员	所在支部 生活费基数	生活费系数 生活费)
employee_fields = %w(org name	id_no org post post_level_des is_not_main_des is_party_member_des belongs_party_des living_base living_salary_rate living_salary)
employee_items.each_with_index do |item,idx|
  salary_item_header.salary_items.create!(name: item,
                                       code: "employee_item_#{salary_item_header.salary_items.where(item_type: "employee_item").length + 1}",
                                       is_calculate: true,
                                       formula: "#{employee_fields[idx]}",
                                       order_by: salary_item_header.salary_items.length + 1,
                                       item_type: "employee_item")
end


pay_items = %w(发放项１	发放项２	发放项３	发放项４	发放项５	发放项６	发放项７	发放项８	发放项９	发放项１０	发放项１１	发放项１２	发放项１３)
deduct_items = %w(养老保险	医疗保险	失业保险	住房公积金	企业年金	扣个税	代扣项１	代扣项２	代扣项３	代扣项４	代扣项５	代扣项６)
pay_items.each_with_index do |item,idx|
  salary_item_header.salary_items.create!(name: item,
                                          code: "pay_item_#{idx + 1}",
                                          order_by: salary_item_header.salary_items.length + 1,
                                          item_type: "pay_item")
end
#应发合计
salary_item_header.salary_items.create!(name: "应发合计",
                                       code: "pay_item_#{salary_item_header.salary_items.where(item_type: "pay_item").sum(1) + 1}",
                                       is_calculate: true,
                                       formula: "living_base + pay_item_1 + pay_item_2 + pay_item_3 + pay_item_4 + pay_item_5 + pay_item_6 + pay_item_7 + pay_item_8 + pay_item_9  + pay_item_10 + pay_item_11 + pay_item_12 ",
                                       order_by: salary_item_header.salary_items.length + 1,
                                       item_type: "pay_item")

#扣款项
deduct_items.each_with_index do |item,idx|
  salary_item_header.salary_items.create!(name: item,
                                         code: "deduct_item_#{salary_item_header.salary_items.where(item_type: "deduct_item").sum(1) + 1}",
                                         order_by: salary_item_header.salary_items.length + 1,
                                         item_type: "deduct_item")
end
#扣款合计
salary_item_header.salary_items.create!(name: "扣款合计",
                                       code: "deduct_item_#{salary_item_header.salary_items.where(item_type: "deduct_item").sum(1) + 1}",
                                       is_calculate: true,
                                       formula: " deduct_item_1 + deduct_item_2 + deduct_item_3 + deduct_item_4 + deduct_item_5 + deduct_item_6 + deduct_item_6 + deduct_item_7 + deduct_item_8 + deduct_item_9 + deduct_item_10 + deduct_item_11 + deduct_item_12 ",
                                       order_by: salary_item_header.salary_items.length + 1,
                                       item_type: "deduct_item")
#实发合计
salary_item_header.salary_items.create!(name: "实发合计",
                                       code: "pay_item_#{salary_item_header.salary_items.where(item_type: "pay_item").sum(1) + 1}",
                                       is_calculate: true,
                                       formula: "living_base + pay_item_1 + pay_item_2 + pay_item_3 + pay_item_4 + pay_item_5 + pay_item_6 + pay_item_7 + pay_item_8 + pay_item_9  + pay_item_10 + pay_item_11 + pay_item_12  - deduct_item_13",
                                       order_by:  salary_item_header.salary_items.length + 1,
                                       item_type: "pay_item")



#县劳务
salary_item_header = SalaryItemHeader.new(name: "工资表模板-县局劳务",code: "xian_non_staff",employee_where: {work_state: "non_staff"})
table_header = "<tr>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>序号</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>单位</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>姓名</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>身份证号</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>部门</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>岗位</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>月度绩效基数</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>年终奖绩效基数</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>绩效系数</th>
                      <th colspan='14' style='text-align : center;vertical-align : middle;'>发放项</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>应发合计</th>
                      <th colspan='12' style='text-align : center;vertical-align : middle;'>代扣代缴款项</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>扣款合计</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>实发合计</th>
                    </tr>
                    <tr>
                      <th style='text-align : center;vertical-align : middle;'>岗位工资</th>
                      <th style='text-align : center;vertical-align : middle;'>绩效工资</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项1</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项2</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项3</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项4</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项5</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项6</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项7</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项8</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项9</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项10</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项11</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项12</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项13</th>
                      <th style='text-align : center;vertical-align : middle;'>养老保险</th>
                      <th style='text-align : center;vertical-align : middle;'>医疗保险</th>
                      <th style='text-align : center;vertical-align : middle;'>失业保险</th>
                      <th style='text-align : center;vertical-align : middle;'>住房公积金</th>
                      <th style='text-align : center;vertical-align : middle;'>企业年金</th>
                      <th style='text-align : center;vertical-align : middle;'>扣个税</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项1</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项2</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项3</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项4</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项5</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项6</th>
                    </tr>"
                    salary_item_header.table_header = table_header
salary_item_header.save!
employee_items = %w(单位 姓名项目	身份证号 部门 岗位 月度绩效基数 年终奖绩效基数 绩效系数 岗位工资 绩效工资 )
employee_fields = %w(org name	id_no org post mth_pref_base year_pref_base pref_rate post_salary pref_salary)
employee_items.each_with_index do |item,idx|
  salary_item_header.salary_items.create!(name: item,
                                       code: "employee_item_#{salary_item_header.salary_items.where(item_type: "employee_item").length + 1}",
                                       is_calculate: true,
                                       formula: "#{employee_fields[idx]}",
                                       order_by: salary_item_header.salary_items.length + 1,
                                       item_type: "employee_item")
end


pay_items = %w(发放项1 发放项2 发放项3 发放项4 发放项5 发放项6 发放项7 发放项8 发放项9 发放项10 发放项11 发放项12 发放项13)
deduct_items = %w(养老保险 医疗保险 失业保险 住房公积金 企业年金 扣个税 代扣项1 代扣项2 代扣项3 代扣项4 代扣项5 代扣项6)
pay_items.each_with_index do |item,idx|
  salary_item_header.salary_items.create!(name: item,
                                          code: "pay_item_#{idx + 1}",
                                          order_by: salary_item_header.salary_items.length + 1,
                                          item_type: "pay_item")
end
#应发合计
salary_item_header.salary_items.create!(name: "应发合计",
                                       code: "pay_item_#{salary_item_header.salary_items.where(item_type: "pay_item").sum(1) + 1}",
                                       is_calculate: true,
                                       formula: "post_salary + pref_salary + pay_item_1 + pay_item_2 + pay_item_3 + pay_item_4 + pay_item_5 + pay_item_6 + pay_item_7 + pay_item_8 + pay_item_9  + pay_item_10 + pay_item_11 + pay_item_12 + pay_item_13",
                                       order_by: salary_item_header.salary_items.length + 1,
                                       item_type: "pay_item")

#扣款项
deduct_items.each_with_index do |item,idx|
  salary_item_header.salary_items.create!(name: item,
                                         code: "deduct_item_#{salary_item_header.salary_items.where(item_type: "deduct_item").sum(1) + 1}",
                                         order_by: salary_item_header.salary_items.length + 1,
                                         item_type: "deduct_item")
end
#扣款合计
salary_item_header.salary_items.create!(name: "扣款合计",
                                       code: "deduct_item_#{salary_item_header.salary_items.where(item_type: "deduct_item").sum(1) + 1}",
                                       is_calculate: true,
                                       formula: " deduct_item_1 + deduct_item_2 + deduct_item_3 + deduct_item_4 + deduct_item_5 + deduct_item_6 + deduct_item_6 + deduct_item_7 + deduct_item_8 + deduct_item_9 + deduct_item_10 + deduct_item_11 + deduct_item_12 ",
                                       order_by: salary_item_header.salary_items.length + 1,
                                       item_type: "deduct_item")
#实发合计
salary_item_header.salary_items.create!(name: "实发合计",
                                       code: "pay_item_#{salary_item_header.salary_items.where(item_type: "pay_item").sum(1) + 1}",
                                       is_calculate: true,
                                       formula: "post_salary + pref_salary + pay_item_1 + pay_item_2 + pay_item_3 + pay_item_4 + pay_item_5 + pay_item_6 + pay_item_7 + pay_item_8 + pay_item_9  + pay_item_10 + pay_item_11 + pay_item_12  - deduct_item_13",
                                       order_by:  salary_item_header.salary_items.length + 1,
                                       item_type: "pay_item")




#市局领导
salary_item_header = SalaryItemHeader.new(name: "工资表模板-市局领导",code: "shi_leader",employee_where: {post_level: 1,work_state: "on_duty"})
table_header = "<tr>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>序号</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>单位</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>姓名</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>身份证号</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>职务</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>职级</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>是否党员</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>所在支部</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>发放标准</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>省局核定前年薪酬</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>省局核定去年薪酬</th>
                      <th colspan='7' style='text-align : center;vertical-align : middle;'>发放项</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>应发合计</th>
                      <th colspan='12' style='text-align : center;vertical-align : middle;'>代扣代缴款项</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>扣款合计</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>实发合计</th>
                    </tr>
                    <tr>
                      <th style='text-align : center;vertical-align : middle;'>基本工资</th>
                      <th style='text-align : center;vertical-align : middle;'>绩效工资</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项１</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项２</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项３</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项４</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项５</th>
                      <th style='text-align : center;vertical-align : middle;'>养老保险</th>
                      <th style='text-align : center;vertical-align : middle;'>医疗保险</th>
                      <th style='text-align : center;vertical-align : middle;'>失业保险</th>
                      <th style='text-align : center;vertical-align : middle;'>住房公积金</th>
                      <th style='text-align : center;vertical-align : middle;'>企业年金</th>
                      <th style='text-align : center;vertical-align : middle;'>扣个税</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项１</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项２</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项３</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项４</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项５</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项６</th>
                    </tr>"
                    salary_item_header.table_header = table_header
salary_item_header.save!

employee_items = %w(单位 姓名项目	身份证号	职务	职级	是否党员	所在支部 发放标准 省局核定前年薪酬 省局核定去年薪酬 基本工资 绩效工资 )
employee_fields = %w(org name	id_no post post_level_des is_party_member_des belongs_party_des grant_rate wage_before_last wage_last basic_salary pref_salary)
employee_items.each_with_index do |item,idx|
  salary_item_header.salary_items.create!(name: item,
                                       code: "employee_item_#{salary_item_header.salary_items.where(item_type: "employee_item").length + 1}",
                                       is_calculate: true,
                                       formula: "#{employee_fields[idx]}",
                                       order_by: salary_item_header.salary_items.length + 1,
                                       item_type: "employee_item")
end


pay_items = %w(发放项１ 发放项２ 发放项３ 发放项４ 发放项５)
deduct_items = %w(养老保险 医疗保险 失业保险 住房公积金 企业年金 扣个税 代扣项１ 代扣项２ 代扣项３ 代扣项４ 代扣项５ 代扣项６)
pay_items.each_with_index do |item,idx|
  salary_item_header.salary_items.create!(name: item,
                                          code: "pay_item_#{idx + 1}",
                                          order_by: salary_item_header.salary_items.length + 1,
                                          item_type: "pay_item")
end
#应发合计
salary_item_header.salary_items.create!(name: "应发合计",
                                       code: "pay_item_#{salary_item_header.salary_items.where(item_type: "pay_item").sum(1) + 1}",
                                       is_calculate: true,
                                       formula: "basic_salary + pref_salary + pay_item_1 + pay_item_2 +  pay_item_3 + pay_item_4 + pay_item_5",
                                       order_by: salary_item_header.salary_items.length + 1,
                                       item_type: "pay_item")

#扣款项
deduct_items.each_with_index do |item,idx|
  salary_item_header.salary_items.create!(name: item,
                                         code: "deduct_item_#{salary_item_header.salary_items.where(item_type: "deduct_item").sum(1) + 1}",
                                         order_by: salary_item_header.salary_items.length + 1,
                                         item_type: "deduct_item")
end
#扣款合计
salary_item_header.salary_items.create!(name: "扣款合计",
                                       code: "deduct_item_#{salary_item_header.salary_items.where(item_type: "deduct_item").sum(1) + 1}",
                                       is_calculate: true,
                                       formula: "deduct_item_1 + deduct_item_2 + deduct_item_3 + deduct_item_4 + deduct_item_5 + deduct_item_6 + deduct_item_6 + deduct_item_7 + deduct_item_8 + deduct_item_9 + deduct_item_10 + deduct_item_11 + deduct_item_12",
                                       order_by: salary_item_header.salary_items.length + 1,
                                       item_type: "deduct_item")
#实发合计
salary_item_header.salary_items.create!(name: "实发合计",
                                       code: "pay_item_#{salary_item_header.salary_items.where(item_type: "pay_item").sum(1) + 1}",
                                       is_calculate: true,
                                       formula: "basic_salary + pref_salary + pay_item_1 + pay_item_2 +  pay_item_3 + pay_item_4 + pay_item_5 - deduct_item_13",
                                       order_by:  salary_item_header.salary_items.length + 1,
                                       item_type: "pay_item")




#市局在岗
salary_item_header = SalaryItemHeader.new(name: "工资表模板-市局在岗",code: "shi_on_duty",employee_where: {post_level: [2,3,4,5,9],work_state: "on_duty"})
table_header = "<tr>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>序号</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>单位</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>姓名</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>身份证号</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>职级</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>员工性质</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>是否党员</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>所在支部</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>月度绩效基数</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>年终奖绩效基数</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>绩效系数</th>
                      <th colspan='14' style='text-align : center;vertical-align : middle;'>发放项</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>应发合计</th>
                      <th colspan='12' style='text-align : center;vertical-align : middle;'>代扣代缴款项</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>扣款合计</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>实发合计</th>
                    </tr>
                    <tr>
                      <th style='text-align : center;vertical-align : middle;'>岗位工资</th>
                      <th style='text-align : center;vertical-align : middle;'>绩效工资</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项１</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项２</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项３</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项４</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项５</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项6</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项7</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项8</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项9</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项10</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项11</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项12</th>
                      <th style='text-align : center;vertical-align : middle;'>养老保险</th>
                      <th style='text-align : center;vertical-align : middle;'>医疗保险</th>
                      <th style='text-align : center;vertical-align : middle;'>失业保险</th>
                      <th style='text-align : center;vertical-align : middle;'>住房公积金</th>
                      <th style='text-align : center;vertical-align : middle;'>企业年金</th>
                      <th style='text-align : center;vertical-align : middle;'>扣个税</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项１</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项２</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项３</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项４</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项５</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项６</th>
                    </tr>"
                    salary_item_header.table_header = table_header
salary_item_header.save!
employee_items = %w(单位 姓名项目	身份证号	职级 员工性质	是否党员	所在支部 月度绩效基数	年终奖绩效基数	绩效系数 岗位工资	绩效工资)
employee_fields = %w(org name	id_no post_level_des is_not_main_des is_party_member_des belongs_party_des mth_pref_base year_pref_base pref_rate post_salary pref_salary)
employee_items.each_with_index do |item,idx|
  salary_item_header.salary_items.create!(name: item,
                                       code: "employee_item_#{salary_item_header.salary_items.where(item_type: "employee_item").length + 1}",
                                       is_calculate: true,
                                       formula: "#{employee_fields[idx]}",
                                       order_by: salary_item_header.salary_items.length + 1,
                                       item_type: "employee_item")
end


pay_items = %w(发放项１	发放项２	发放项３	发放项４	发放项５	发放项６	发放项７	发放项８	发放项９	发放项１０	发放项１１	发放项１２)
deduct_items = %w(养老保险 医疗保险	失业保险	住房公积金	企业年金	扣个税	代扣项1	代扣项2	代扣项3	代扣项4	代扣项5	代扣项6)
pay_items.each_with_index do |item,idx|
  salary_item_header.salary_items.create!(name: item,
                                          code: "pay_item_#{idx + 1}",
                                          order_by: salary_item_header.salary_items.length + 1,
                                          item_type: "pay_item")
end
#应发合计
salary_item_header.salary_items.create!(name: "应发合计",
                                       code: "pay_item_#{salary_item_header.salary_items.where(item_type: "pay_item").sum(1) + 1}",
                                       is_calculate: true,
                                       formula: "post_salary + pref_salary + pay_item_1 + pay_item_2 +  pay_item_3 + pay_item_4 + pay_item_5 + pay_item_6 + pay_item_7 + pay_item_8 + pay_item_9  + pay_item_10 + pay_item_11 + pay_item_12",
                                       order_by: salary_item_header.salary_items.length + 1,
                                       item_type: "pay_item")

#扣款项
deduct_items.each_with_index do |item,idx|
  salary_item_header.salary_items.create!(name: item,
                                         code: "deduct_item_#{salary_item_header.salary_items.where(item_type: "deduct_item").sum(1) + 1}",
                                         order_by: salary_item_header.salary_items.length + 1,
                                         item_type: "deduct_item")
end
#扣款合计
salary_item_header.salary_items.create!(name: "扣款合计",
                                       code: "deduct_item_#{salary_item_header.salary_items.where(item_type: "deduct_item").sum(1) + 1}",
                                       is_calculate: true,
                                       formula: " deduct_item_1 + deduct_item_2 + deduct_item_3 + deduct_item_4 + deduct_item_5 + deduct_item_6 + deduct_item_6 + deduct_item_7 + deduct_item_8 + deduct_item_9 + deduct_item_10 + deduct_item_11 + deduct_item_12 ",
                                       order_by: salary_item_header.salary_items.length + 1,
                                       item_type: "deduct_item")
#实发合计
salary_item_header.salary_items.create!(name: "实发合计",
                                       code: "pay_item_#{salary_item_header.salary_items.where(item_type: "pay_item").sum(1) + 1}",
                                       is_calculate: true,
                                       formula: "post_salary + pref_salary + pay_item_1 + pay_item_2 +  pay_item_3 + pay_item_4 + pay_item_5 + pay_item_6 + pay_item_7 + pay_item_8 + pay_item_9  + pay_item_10 + pay_item_11 + pay_item_12 - deduct_item_13",
                                       order_by:  salary_item_header.salary_items.length + 1,
                                       item_type: "pay_item")

#市局遍外加内退
salary_item_header = SalaryItemHeader.new(name: "工资表模板-市局编外加内退",code: "shi_non_staff",employee_where: {work_state: ["retired","non_staff"]})
table_header = "<tr>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>序号</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>单位</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>姓名</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>身份证号</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>职级</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>员工性质</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>是否党员</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>所在支部</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>月度绩效基数</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>年终奖绩效基数</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>绩效系数</th>
                      <th colspan='14' style='text-align : center;vertical-align : middle;'>发放项</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>应发合计</th>
                      <th colspan='12' style='text-align : center;vertical-align : middle;'>代扣代缴款项</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>扣款合计</th>
                      <th rowspan='2' style='text-align : center;vertical-align : middle;'>实发合计</th>
                    </tr>
                    <tr>
                      <th style='text-align : center;vertical-align : middle;'>岗位工资</th>
                      <th style='text-align : center;vertical-align : middle;'>绩效工资</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项１</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项２</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项３</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项４</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项５</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项6</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项7</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项8</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项9</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项10</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项11</th>
                      <th style='text-align : center;vertical-align : middle;'>发放项12</th>
                      <th style='text-align : center;vertical-align : middle;'>养老保险</th>
                      <th style='text-align : center;vertical-align : middle;'>医疗保险</th>
                      <th style='text-align : center;vertical-align : middle;'>失业保险</th>
                      <th style='text-align : center;vertical-align : middle;'>住房公积金</th>
                      <th style='text-align : center;vertical-align : middle;'>企业年金</th>
                      <th style='text-align : center;vertical-align : middle;'>扣个税</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项１</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项２</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项３</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项４</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项５</th>
                      <th style='text-align : center;vertical-align : middle;'>代扣项６</th>
                    </tr>"
                    salary_item_header.table_header = table_header
salary_item_header.save!
employee_items = %w(单位 姓名项目	身份证号	职级 员工性质	是否党员	所在支部 月度绩效基数	年终奖绩效基数	绩效系数 岗位工资	绩效工资)
employee_fields = %w(org name	id_no post_level_des is_not_main_des is_party_member_des belongs_party_des mth_pref_base year_pref_base pref_rate post_salary pref_salary)
employee_items.each_with_index do |item,idx|
  salary_item_header.salary_items.create!(name: item,
                                       code: "employee_item_#{salary_item_header.salary_items.where(item_type: "employee_item").length + 1}",
                                       is_calculate: true,
                                       formula: "#{employee_fields[idx]}",
                                       order_by: salary_item_header.salary_items.length + 1,
                                       item_type: "employee_item")
end

pay_items = %w(发放项１	发放项２	发放项３	发放项４	发放项５	发放项６	发放项７	发放项８	发放项９	发放项１０	发放项１１	发放项１２)
deduct_items = %w(养老保险 医疗保险	失业保险	住房公积金	企业年金	扣个税	代扣项1	代扣项2	代扣项3	代扣项4	代扣项5	代扣项6)
pay_items.each_with_index do |item,idx|
  salary_item_header.salary_items.create!(name: item,
                                          code: "pay_item_#{idx + 1}",
                                          order_by: salary_item_header.salary_items.length + 1,
                                          item_type: "pay_item")
end
#应发合计
salary_item_header.salary_items.create!(name: "应发合计",
                                       code: "pay_item_#{salary_item_header.salary_items.where(item_type: "pay_item").sum(1) + 1}",
                                       is_calculate: true,
                                       formula: "post_salary + pref_salary + pay_item_1 + pay_item_2 +  pay_item_3 + pay_item_4 + pay_item_5 + pay_item_6 + pay_item_7 + pay_item_8 + pay_item_9  + pay_item_10 + pay_item_11 + pay_item_12",
                                       order_by: salary_item_header.salary_items.length + 1,
                                       item_type: "pay_item")

#扣款项
deduct_items.each_with_index do |item,idx|
  salary_item_header.salary_items.create!(name: item,
                                         code: "deduct_item_#{salary_item_header.salary_items.where(item_type: "deduct_item").sum(1) + 1}",
                                         order_by: salary_item_header.salary_items.length + 1,
                                         item_type: "deduct_item")
end
#扣款合计
salary_item_header.salary_items.create!(name: "扣款合计",
                                       code: "deduct_item_#{salary_item_header.salary_items.where(item_type: "deduct_item").sum(1) + 1}",
                                       is_calculate: true,
                                       formula: " deduct_item_1 + deduct_item_2 + deduct_item_3 + deduct_item_4 + deduct_item_5 + deduct_item_6 + deduct_item_6 + deduct_item_7 + deduct_item_8 + deduct_item_9 + deduct_item_10 + deduct_item_11 + deduct_item_12 ",
                                       order_by: salary_item_header.salary_items.length + 1,
                                       item_type: "deduct_item")
#实发合计
salary_item_header.salary_items.create!(name: "实发合计",
                                       code: "pay_item_#{salary_item_header.salary_items.where(item_type: "pay_item").sum(1) + 1}",
                                       is_calculate: true,
                                       formula: "post_salary + pref_salary + pay_item_1 + pay_item_2 +  pay_item_3 + pay_item_4 + pay_item_5 + pay_item_6 + pay_item_7 + pay_item_8 + pay_item_9  + pay_item_10 + pay_item_11 + pay_item_12 - deduct_item_13",
                                       order_by:  salary_item_header.salary_items.length + 1,
                                       item_type: "pay_item")
