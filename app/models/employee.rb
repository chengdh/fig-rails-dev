#coding: utf-8
#雇员信息
class Employee < ActiveRecord::Base
  #在岗
  WORK_STATE_ON_DUTY = "on_duty"
  #内退
  WORK_STATE_RETIRED = "retired"
  #遍外离岗
  WORK_STATE_NON_STAFF = "non_staff"

  belongs_to :org
  belongs_to :user
  validates :name,:org_id, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  default_scope {order("org_id")}
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def work_state_des
    ret = ""
    ret = "在岗" if work_state.eql?("on_duty")
    ret = "内退" if work_state.eql?("retired")
    ret = "编外离岗" if work_state.eql?("non_staff")
    ret
  end
  def post_level_des
    ret = ""
    ret = "领导" if post_level == 1
    ret = "正科" if post_level == 2
    ret = "正协" if post_level == 3
    ret = "副科" if post_level == 4
    ret = "副协" if post_level == 5
    ret = "正股" if post_level == 6
    ret = "副股" if post_level == 7
    ret = "一般人员" if post_level == 9
    ret
  end
  def belongs_party_des
    ret = ""
    ret = "一支部" if belongs_party.eql?('party_1')
    ret = "二支部" if belongs_party.eql?('party_2')
    ret = "三支部" if belongs_party.eql?("party_3")
    ret
  end
  def is_not_main_des
    ret = ""
    ret = "三产" if is_not_main
    ret = "在册" unless is_not_main
    ret
  end

  def is_party_member_des
    ret = ""
    ret = "是" if is_party_member
    ret = "否" unless is_party_member
    ret
  end

  def get_salary_item_header
    #获取员工对应的工资表模板
    header = nil
    SalaryItemHeader.where(is_active: true).each do |sih|
      wh = sih.employee_where
      post_level_sel = false
      if wh.key?(:post_level)
        pl = wh[:post_level]
        if pl.kind_of?(Array)
          post_level_sel = true if pl.include?(post_level)
        else
          post_level_sel = true if pl.== post_level
        end
      end

      work_state_sel = false
      if wh.key?(:work_state)
        wt = wh[:work_state]
        if wt.kind_of?(Array)
          work_state_sel = true if wt.include?(work_state)
        else
          work_state_sel = true if wt.== work_state
        end
      end
      header = sih if post_level_sel and work_state_sel
    end
    header
  end

  #得到主要的工资项目
  def get_salary_item_cols
    header = get_salary_item_header
    #基本
    item_names = %w(生活费 基本工资 岗位工资 绩效工资 发放项１ 发放项２ 发放项３ 发放项４ 应发合计 养老保险 医疗保险 失业保险  住房公积金 企业年金 扣个税 扣款合计 实发合计)
    item_hash = {}
    item_names.each do |name|
      salary_item  = header.salary_items.find_by(name: name)
      if salary_item.present?
        item_code  =  salary_item.try(:code)
        #员工字段使用formula
        item_code = salary_item.try(:formula) if salary_item.item_type.eql?("employee_item")

        item_hash[item_code.to_sym] = name if item_code.present?
      end
    end
    item_hash
  end
  #获取给定月份的工资数据
  def get_salary_detail_by_mth(mth)
    ret = {}
    salary_item_cols = get_salary_item_cols
    st = SalaryTableLine.ransack(employee_id_eq: id,salary_table_mth_eq: mth).result.limit(1).try(:first)
    salary_item_cols.each do |code,name|
      ret[name] = st.try(code)
    end
    ret
  end
end
