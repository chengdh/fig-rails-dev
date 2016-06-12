#coding: utf-8
#领导干部薪酬台帐明细
class SalaryReportLeaderLine < ActiveRecord::Base
  belongs_to :salary_report_leader
  belongs_to :employee

  #根据表达式计算合计
  #目前exp 只支持加法运算
  def cal_sum(exp)
    ret = 0
    (1..13).each do |mth|
      ret += send(cal_item,mth,exp)
    end
    ret
  end

  #根据表达式计算收入及扣除项
  def cal_item(mth,exp)
    ret = 0
    cols = exp.split("+")
    cols.each do |c|
      ret += send("mth_#{mth}st_#{c.strip}".to_sym)
    end
  end


  #应发数合计
  def sum_pay_item_11
    ret = 0
    (1..13).each do |mth|
      ret += send("pay_item_11_by_mth",mth)
    end
    ret
  end
  #养老、医疗、失业保险合计
  def sum_deduct_item_1_3
    ret = 0
    (1..13).each do |mth|
      ret += send("deduct_item_1_3_by_mth",mth)
    end
    ret
  end

  #住房公积金合计
  def sum_deduct_item_4
    ret = 0
    (1..13).each do |mth|
      ret += send("deduct_item_4_by_mth",mth)
    end
    ret
  end

  #企业年金
  def sum_deduct_item_5
    ret = 0
    (1..13).each do |mth|
      ret += send("deduct_item_5_by_mth",mth)
    end
    ret

  end
  #个税合计
  def sum_deduct_item_6
    ret = 0
    (1..13).each do |mth|
      ret += send("deduct_item_6_by_mth",mth)
    end
    ret
  end

  #其他代扣项合计
  def sum_deduct_item_7_12_by_mth
    ret = 0
    (1..13).each do |mth|
      ret += send("deduct_item_7_12_by_mth",mth)
    end
    ret

  end

  #实发数合计
  def sum_pay_item_12
    ret = 0
    (1..13).each do |mth|
      ret += send("pay_item_12_by_mth",mth)
    end
    ret
  end
  #
  #基本
  def pay_item_4_by_mth(mth)
    send("mth_#{mth}st_pay_item_4".to_sym)
  end
  #绩效
  def pay_item_5_by_mth(mth)
    send("mth_#{mth}st_pay_item_5".to_sym)
  end
  #其他收入
  def pay_item_6_10_by_mth(mth)
    send("mth_#{mth}st_pay_item_6".to_sym) +
    send("mth_#{mth}st_pay_item_7".to_sym) +
    send("mth_#{mth}st_pay_item_8".to_sym) +
    send("mth_#{mth}st_pay_item_9".to_sym) +
    send("mth_#{mth}st_pay_item_10".to_sym)
  end

  #应发小计
  def pay_item_11_by_mth(mth)
    send("mth_#{mth}st_pay_item_11".to_sym)
  end
  #养老、医疗、失业保险合计
  def deduct_item_1_3_by_mth(mth)
    send("mth_#{mth}st_deduct_item_1".to_sym) +
    send("mth_#{mth}st_deduct_item_2".to_sym) +
    send("mth_#{mth}st_deduct_item_3".to_sym)
  end
  #住房公积金
  def deduct_item_4_by_mth(mth)
    send("mth_#{mth}st_deduct_item_4".to_sym)
  end
  #企业年金
  def deduct_item_5_by_mth(mth)
    send("mth_#{mth}st_deduct_item_5".to_sym)
  end

  #个税合计
  def deduct_item_6_by_mth(mth)
    send("mth_#{mth}st_deduct_item_6".to_sym)
  end

  #其他代扣项合计
  def deduct_item_7_12_by_mth(mth)
    send("mth_#{mth}st_deduct_item_7".to_sym) +
    send("mth_#{mth}st_deduct_item_8".to_sym) +
    send("mth_#{mth}st_deduct_item_9".to_sym) +
    send("mth_#{mth}st_deduct_item_10".to_sym) +
    send("mth_#{mth}st_deduct_item_11".to_sym) +
    send("mth_#{mth}st_deduct_item_12".to_sym)
  end
  #扣除小计
  def deduct_item_13_by_mth(mth)
    send("mth_#{mth}st_deduct_item_13".to_sym)
  end
  #实发小
  def pay_item_12_by_mth(mth)
    send("mth_#{mth}st_pay_item_12".to_sym)
  end
end
