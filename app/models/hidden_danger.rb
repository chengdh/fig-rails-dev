#coding: utf-8
#隐患整改
class HiddenDanger < ActiveRecord::Base
  belongs_to :org
  belongs_to :danger_org,class_name: "Org"
  belongs_to :user
  belongs_to :deliver,class_name: "User"

  acts_as_tree order: "danger_date ASC"

  #上报整改情况用户
  belongs_to :fixer,class_name: "User"

  #延期操作用户
  belongs_to :postponement_oper,class_name: "User"

  #复查操作用户
  belongs_to :reviewer,class_name: "User"
  validates :user_id,:org_id,:danger_org_id,:name,:danger_date,:fix_period,:fixed_state,:review_state,presence: true
  validates :k_marks, numericality: true

  has_attached_file :photo_1, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo_1, content_type: /\Aimage\/.*\Z/

  has_attached_file :photo_2, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo_2, content_type: /\Aimage\/.*\Z/

  has_attached_file :photo_3, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo_3, content_type: /\Aimage\/.*\Z/

  has_attached_file :photo_4, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo_4, content_type: /\Aimage\/.*\Z/

  has_attached_file :photo_5, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo_5, content_type: /\Aimage\/.*\Z/

  has_attached_file :photo_6, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo_6, content_type: /\Aimage\/.*\Z/

  has_attached_file :fixed_photo_1, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :fixed_photo_1, content_type: /\Aimage\/.*\Z/
  has_attached_file :fixed_photo_2, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :fixed_photo_2, content_type: /\Aimage\/.*\Z/
  has_attached_file :fixed_photo_3, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :fixed_photo_3, content_type: /\Aimage\/.*\Z/
  has_attached_file :fixed_photo_4, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :fixed_photo_4, content_type: /\Aimage\/.*\Z/

  has_attached_file :fixed_photo_5, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :fixed_photo_5, content_type: /\Aimage\/.*\Z/

  has_attached_file :fixed_photo_6, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :fixed_photo_6, content_type: /\Aimage\/.*\Z/


  default_scope {order("danger_date ASC,fixed_state,review_state")}
  #待处理
  scope :waitting_process,->(org_ids){ where(fixed_state: "deliveried",danger_org_id: org_ids)}
  #待复查
  scope :waitting_review,->(org_ids){ where(fixed_state: "fixed",review_state: "draft",org_id: org_ids)}
  default_value_for(:danger_date) {Date.today}
  default_value_for(:table_date) {Date.today}
  before_create :gen_bill_no


  def fix_period_des
    ret = ""
    ret = "15日" if fix_period == 15
    ret = "1个月" if fix_period == 30
    ret = "3个月" if fix_period == 90
    ret = "6个月" if fix_period == 180
    ret
  end
  def fixed_state_des
    ret = ""
    ret = "草稿(未处理)" if fixed_state.eql?("draft")
    ret = "待整改" if fixed_state.eql?("deliveried")
    ret = "处理中" if fixed_state.eql?("processing")
    ret = "待复查" if fixed_state.eql?("fixed")
    ret = "整改完成" if review_state.eql?("review_ok") and fixed_state.eql?("fixed")
    ret = "复查不合格" if review_state.eql?("review_reject") and fixed_state.eql?("fixed")
    ret
  end
  #整改情况说明
  def fix_result
    ret = ""
    ret = fixed_state_des
    ret = "申请延期" if fixed_state.eql?("deliveried") and postponement_days > 0
    ret
  end
  #根据fixed_state获取在前端显示的颜色
  #待整改 -- 黄色
  #待复查 -- 蓝色
  #整改合格 -- 绿色
  #整个不合格 -- 红色
  def fixed_state_class
    css = ""
    css = "label label-warning" if ["draft","deliveried"].include?(fixed_state)
    css = "label label-info" if ["processing","fixed"].include?(fixed_state)
    css = "label label-success" if ["review_ok"].include?(fixed_state)
    css = "label label-danger" if review_state.eql?("review_reject")
    css
  end
  def review_state_des
    ret = ""
    ret = "草稿(未处理)" if review_state.eql?("draft")
    ret = "待处理" if fixed_state.eql?("fixed")
    ret = "合格" if review_state.eql?("review_ok")
    ret = "不合格" if review_state.eql?("review_reject")
    ret
  end
  def review_state_class
    css = "" if review_state.eql?("draft")
    css = "label label-success" if review_state.eql?("review_ok")
    css = "label label-danger" if review_state.eql?("review_reject")
    css
  end
  #下发
  def delivery(user)
    attrs = {
      fixed_state: "deliveried",
      deliver: user,
      deliver_date: Date.today,
      k_marks: cal_k_marks("deliveried")
    }
    update_attributes(attrs)
  end
  #整改完成
  def fix(fixer,attrs)
    marks = cal_k_marks("fixed")
    attrs.merge!(fixer: fixer,fixed_state: "fixed",fixed_date: Date.today,k_marks: marks)
    update_attributes(attrs)
  end
  #复查
  def review(review_ok = true,attrs)
    ret = false
    if review_ok
      attrs.merge!(review_state: "review_ok")
      ret = update_attributes(attrs)
    else
      marks = cal_k_marks("review_reject")
      attrs.merge!(review_state: "review_reject",k_marks: marks)
      ret = update_attributes(attrs)
      #创建新的隐患记录
      new_hidden_danger = HiddenDanger.new(parent_id: id,
                                           org_id: org_id,
                                           danger_org_id: danger_org_id,
                                           user_id: attrs[:reviewer_id],
                                           fix_period: fix_period,
                                           review_count: children.size + 1,
                                           name: name
                                          )
      ret = new_hidden_danger.save!
      #下发新的隐患记录
      ret = new_hidden_danger.update_attributes(fixed_state: "deliveried",deliver_date: Date.today,deliver_id: attrs[:reviewer_id])
    end
    ret
  end

  #延期
  def postponement(user,attrs)
    attrs.merge!(postponement_oper: user,postponement_date: Date.today)
    update_attributes(attrs)
  end

  #是否超期
  def is_expired?
    the_date = fixed_date
    the_date = Date.today if fixed_date.blank?
    the_date > deliver_date + fix_period.days + postponement_days
  end

  #隐患类型描述
  def categ_des
    ret = "普通隐患"
    ret = "重大隐患" if is_big?
    ret
  end

  #整改截至时间
  def expire_fix_date
    (deliver_date || danger_date) + fix_period.days
  end
  #当年隐患数量
  def this_year_danger_count
    HiddenDanger.where(["YEAR(danger_date) = ? AND danger_org_id = ?",Date.today.year,danger_org_id]).count + 1
  end
  protected
  #年份（2位）+单位代码（2位）+顺序编号（3位）。如2016年发现的桐柏县局第13个事故隐患，即1630013。
  def gen_bill_no
    self.bill_no = "#{Date.today.year}#{danger_org.try(:code)}#{'%03d' % (this_year_danger_count)}"
  end

  #计算扣分
  #op_state 操作状态
  def cal_k_marks(op_state)
    marks = k_marks
    if op_state.eql?("deliveried")
      #重大隐患扣1分
      marks -= 1 if is_big? and review_count == 0
    end
    #超期扣0.5分
    if op_state.eql?('fixed') and review_state.eql?("draft") and is_expired?
      marks -=  0.5
    end
    #复查不通过扣0.5分
    if op_state.eql?('review_reject')
      marks -=  0.5
    end
    marks
  end
end
