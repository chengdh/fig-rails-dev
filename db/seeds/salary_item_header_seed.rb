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
#                                                is_calculate: true,
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
salary_item_header = SalaryItemHeader.new(name: "工资表模板-县局领导",employee_where: {post_level: 1,work_state: "on_duty"})
salary_item_header.save!

pay_items = %w(市局核定前年薪酬 市局核定去年薪酬 基本工资 绩效工资 发放项１ 发放项２ 发放项３ 发放项４ 发放项５)
pay_items.each_with_index do |item,idx|
  salary_item_header.salary_items.create(name: item,code: "pay_item_#{idx + 1}",order_by: idx+1,item_type: "pay_item")
end
#应发合计
salary_item_header.salary_items.create(name: "应发合计",
                                               code: "pay_item_#{salary_item_header.salary_items.where(item_type: "pay_item").length + 1}",
                                               is_calculate: true,
                                               formula: "pay_item_3 + pay_item_4 + pay_item_5 + pay_item_6 + pay_item_7 + pay_item_8 + pay_item_9",
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
                                       formula: "deduct_item_1 + deduct_item_2 + deduct_item_3 + deduct_item_4 + deduct_item_5 + deduct_item_6 + deduct_item_6 + deduct_item_7 + deduct_item_8 + deduct_item_9 + deduct_item_10 + deduct_item_11 + deduct_item_12 + deduct_item_13 + deduct_item_13",
                                       order_by: salary_item_header.salary_items.length + 1,
                                       item_type: "deduct_item")
#实发合计
salary_item_header.salary_items.create(name: "实发合计",
                                       code: "pay_item_#{salary_item_header.salary_items.where(item_type: "pay_item").length + 1}",
                                       is_calculate: true,
                                       formula: "(pay_item_3 + pay_item_4 + pay_item_5 + pay_item_6 + pay_item_7 + pay_item_8 + pay_item_9) - (deduct_item_1 + deduct_item_2 + deduct_item_3 + deduct_item_4 + deduct_item_5 + deduct_item_6 + deduct_item_6 + deduct_item_7 + deduct_item_8 + deduct_item_9 + deduct_item_10 + deduct_item_11 + deduct_item_12 + deduct_item_13 + deduct_item_13)",
                                       order_by:  salary_item_header.salary_items.length + 1,
                                       item_type: "pay_item")


#县局在岗
salary_item_header = SalaryItemHeader.new(name: "工资表模板-县局在岗",employee_where: {post_level: [2,3,4,5,9],work_state: "on_duty"})
salary_item_header.save!

pay_items = %w(月度绩效基数	年终奖绩效基数	绩效系数 岗位工资	绩效工资	发放项１	发放项２	发放项３	发放项４	发放项５	发放项６	发放项７	发放项８	发放项９	发放项１０	发放项１１	发放项１２)
deduct_items = %w(养老保险 医疗保险	失业保险	住房公积金	企业年金	扣个税	代扣项1	代扣项2	代扣项3	代扣项4	代扣项5	代扣项6)
pay_items.each_with_index do |item,idx|
  salary_item_header.salary_items.create(name: item,code: "pay_item_#{idx + 1}",order_by: idx+1,item_type: "pay_item")
end
#应发合计
salary_item_header.salary_items.create(name: "应发合计",
                                       code: "pay_item_#{salary_item_header.salary_items.where(item_type: "pay_item").sum(1) + 1}",
                                       is_calculate: true,
                                       formula: " pay_item_4 + pay_item_5 + pay_item_6 + pay_item_7 + pay_item_8 + pay_item_9  + pay_item_10 + pay_item_11 + pay_item_12 + pay_item_13 + pay_item_14 + pay_item_15 + pay_item_16 + pay_item_17",
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
                                       formula: "(pay_item_3 + pay_item_4 + pay_item_5 + pay_item_6 + pay_item_7 + pay_item_8 + pay_item_9) - (deduct_item_1 + deduct_item_2 + deduct_item_3 + deduct_item_4 + deduct_item_5 + deduct_item_6 + deduct_item_6 + deduct_item_7 + deduct_item_8 + deduct_item_9 + deduct_item_10 + deduct_item_11 + deduct_item_12 + deduct_item_13 + deduct_item_13)",
                                       order_by:  salary_item_header.salary_items.length + 1,
                                       item_type: "pay_item")


#县内退
salary_item_header = SalaryItemHeader.new(name: "工资表模板-县局内退",employee_where: {work_state: "retired"})
salary_item_header.save!

pay_items = %w(生活费基数	生活费系数 生活费	发放项１	发放项２	发放项３	发放项４	发放项５	发放项６	发放项７	发放项８	发放项９	发放项１０	发放项１１	发放项１２	发放项１３)
deduct_items = %w(养老保险	医疗保险	失业保险	住房公积金	企业年金	扣个税	代扣项１	代扣项２	代扣项３	代扣项４	代扣项５	代扣项６)
pay_items.each_with_index do |item,idx|
  salary_item_header.salary_items.create!(name: item,code: "pay_item_#{idx + 1}",order_by: idx+1,item_type: "pay_item")
end
#应发合计
salary_item_header.salary_items.create!(name: "应发合计",
                                       code: "pay_item_#{salary_item_header.salary_items.where(item_type: "pay_item").sum(1) + 1}",
                                       is_calculate: true,
                                       formula: " pay_item_3 + pay_item_4 + pay_item_5 + pay_item_6 + pay_item_7 + pay_item_8 + pay_item_9  + pay_item_10 + pay_item_11 + pay_item_12 + pay_item_13 + pay_item_14 + pay_item_15 + pay_item_16",
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
                                       formula: "(pay_item_3 + pay_item_4 + pay_item_5 + pay_item_6 + pay_item_7 + pay_item_8 + pay_item_9  + pay_item_10 + pay_item_11 + pay_item_12 + pay_item_13 + pay_item_14 + pay_item_15 + pay_item_16) - (deduct_item_1 + deduct_item_2 + deduct_item_3 + deduct_item_4 + deduct_item_5 + deduct_item_6 + deduct_item_6 + deduct_item_7 + deduct_item_8 + deduct_item_9 + deduct_item_10 + deduct_item_11 + deduct_item_12)",
                                       order_by:  salary_item_header.salary_items.length + 1,
                                       item_type: "pay_item")



#县劳务
salary_item_header = SalaryItemHeader.new(name: "工资表模板-县局劳务",employee_where: {work_state: "non_staff"})

salary_item_header.save!


pay_items = %w(生活费基数	生活费系数 生活费	发放项１	发放项２	发放项３	发放项４	发放项５	发放项６	发放项７	发放项８	发放项９	发放项１０	发放项１１	发放项１２	发放项１３)
deduct_items = %w(养老保险	医疗保险	失业保险	住房公积金	企业年金	扣个税	代扣项１	代扣项２	代扣项３	代扣项４	代扣项５	代扣项６)
pay_items.each_with_index do |item,idx|
  salary_item_header.salary_items.create!(name: item,code: "pay_item_#{idx + 1}",order_by: idx+1,item_type: "pay_item")
end
#应发合计
salary_item_header.salary_items.create!(name: "应发合计",
                                       code: "pay_item_#{salary_item_header.salary_items.where(item_type: "pay_item").sum(1) + 1}",
                                       is_calculate: true,
                                       formula: " pay_item_3 + pay_item_4 + pay_item_5 + pay_item_6 + pay_item_7 + pay_item_8 + pay_item_9  + pay_item_10 + pay_item_11 + pay_item_12 + pay_item_13 + pay_item_14 + pay_item_15 + pay_item_16",
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
                                       formula: "(pay_item_3 + pay_item_4 + pay_item_5 + pay_item_6 + pay_item_7 + pay_item_8 + pay_item_9  + pay_item_10 + pay_item_11 + pay_item_12 + pay_item_13 + pay_item_14 + pay_item_15 + pay_item_16) - (deduct_item_1 + deduct_item_2 + deduct_item_3 + deduct_item_4 + deduct_item_5 + deduct_item_6 + deduct_item_6 + deduct_item_7 + deduct_item_8 + deduct_item_9 + deduct_item_10 + deduct_item_11 + deduct_item_12)",
                                       order_by:  salary_item_header.salary_items.length + 1,
                                       item_type: "pay_item")




#市局领导
salary_item_header = SalaryItemHeader.new(name: "工资表模板-市局领导",employee_where: {post_level: 1,work_state: "on_duty"})
salary_item_header.save!


pay_items = %w(省局核定前年薪酬 省局核定去年薪酬 基本工资 绩效工资 发放项１ 发放项２ 发放项３ 发放项４ 发放项５)
deduct_items = %w(养老保险 医疗保险 失业保险 住房公积金 企业年金 扣个税 代扣项１ 代扣项２ 代扣项３ 代扣项４ 代扣项５ 代扣项６)
pay_items.each_with_index do |item,idx|
  salary_item_header.salary_items.create!(name: item,code: "pay_item_#{idx + 1}",order_by: idx+1,item_type: "pay_item")
end
#应发合计
salary_item_header.salary_items.create!(name: "应发合计",
                                       code: "pay_item_#{salary_item_header.salary_items.where(item_type: "pay_item").sum(1) + 1}",
                                       is_calculate: true,
                                       formula: " pay_item_3 + pay_item_4 + pay_item_5 + pay_item_6 + pay_item_7 + pay_item_8 + pay_item_9",  
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
                                       formula: "(pay_item_3 + pay_item_4 + pay_item_5 + pay_item_6 + pay_item_7 + pay_item_8 + pay_item_9 ) - (deduct_item_1 + deduct_item_2 + deduct_item_3 + deduct_item_4 + deduct_item_5 + deduct_item_6 + deduct_item_6 + deduct_item_7 + deduct_item_8 + deduct_item_9 + deduct_item_10 + deduct_item_11 + deduct_item_12)",
                                       order_by:  salary_item_header.salary_items.length + 1,
                                       item_type: "pay_item")




#市局在岗
salary_item_header = SalaryItemHeader.new(name: "工资表模板-市局在岗",employee_where: {post_level: [2,3,4,5,9],work_state: "on_duty"})
salary_item_header.save!


pay_items = %w(月度绩效基数	年终奖绩效基数	绩效系数 岗位工资	绩效工资	发放项１	发放项２	发放项３	发放项４	发放项５	发放项６	发放项７	发放项８	发放项９	发放项１０	发放项１１	发放项１２)
deduct_items = %w(养老保险 医疗保险	失业保险	住房公积金	企业年金	扣个税	代扣项1	代扣项2	代扣项3	代扣项4	代扣项5	代扣项6)
pay_items.each_with_index do |item,idx|
  salary_item_header.salary_items.create!(name: item,code: "pay_item_#{idx + 1}",order_by: idx+1,item_type: "pay_item")
end
#应发合计
salary_item_header.salary_items.create!(name: "应发合计",
                                       code: "pay_item_#{salary_item_header.salary_items.where(item_type: "pay_item").sum(1) + 1}",
                                       is_calculate: true,
                                       formula: " pay_item_3 + pay_item_4 + pay_item_5 + pay_item_6 + pay_item_7 + pay_item_8 + pay_item_9  + pay_item_10 + pay_item_11 + pay_item_12 + pay_item_13 + pay_item_14 + pay_item_15 + pay_item_16",
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
                                       formula: "(pay_item_3 + pay_item_4 + pay_item_5 + pay_item_6 + pay_item_7 + pay_item_8 + pay_item_9  + pay_item_10 + pay_item_11 + pay_item_12 + pay_item_13 + pay_item_14 + pay_item_15 + pay_item_16) - (deduct_item_1 + deduct_item_2 + deduct_item_3 + deduct_item_4 + deduct_item_5 + deduct_item_6 + deduct_item_6 + deduct_item_7 + deduct_item_8 + deduct_item_9 + deduct_item_10 + deduct_item_11 + deduct_item_12)",
                                       order_by:  salary_item_header.salary_items.length + 1,
                                       item_type: "pay_item")



#市局遍外加内退
salary_item_header = SalaryItemHeader.new(name: "工资表模板-市局编外加内退",employee_where: {work_state: ["retired","no_staff"]})
salary_item_header.save!


pay_items = %w(月度绩效基数	年终奖绩效基数	绩效系数 岗位工资	绩效工资	发放项１	发放项２	发放项３	发放项４	发放项５	发放项６	发放项７	发放项８	发放项９	发放项１０	发放项１１	发放项１２)
deduct_items = %w(养老保险 医疗保险	失业保险	住房公积金	企业年金	扣个税	代扣项1	代扣项2	代扣项3	代扣项4	代扣项5	代扣项6)
pay_items.each_with_index do |item,idx|
  salary_item_header.salary_items.create!(name: item,code: "pay_item_#{idx + 1}",order_by: idx+1,item_type: "pay_item")
end
#应发合计
salary_item_header.salary_items.create!(name: "应发合计",
                                       code: "pay_item_#{salary_item_header.salary_items.where(item_type: "pay_item").sum(1) + 1}",
                                       is_calculate: true,
                                       formula: " pay_item_3 + pay_item_4 + pay_item_5 + pay_item_6 + pay_item_7 + pay_item_8 + pay_item_9  + pay_item_10 + pay_item_11 + pay_item_12 + pay_item_13 + pay_item_14 + pay_item_15 + pay_item_16",
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
                                       formula: "(pay_item_3 + pay_item_4 + pay_item_5 + pay_item_6 + pay_item_7 + pay_item_8 + pay_item_9  + pay_item_10 + pay_item_11 + pay_item_12 + pay_item_13 + pay_item_14 + pay_item_15 + pay_item_16) - (deduct_item_1 + deduct_item_2 + deduct_item_3 + deduct_item_4 + deduct_item_5 + deduct_item_6 + deduct_item_6 + deduct_item_7 + deduct_item_8 + deduct_item_9 + deduct_item_10 + deduct_item_11 + deduct_item_12)",
                                       order_by:  salary_item_header.salary_items.length + 1,
                                       item_type: "pay_item")
