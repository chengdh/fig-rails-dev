#coding: utf-8
#任务
class Task < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  belongs_to :task_category
  belongs_to :executer,class_name: "User"
  belongs_to :confirmer,class_name: "User"
  belongs_to :deliver,class_name: "User"
  belongs_to :finisher,class_name: "User"
  has_many :task_lines
  validates :org_id,:user_id,:executer_id,:name,:state, presence: true
  accepts_nested_attributes_for :task_lines,reject_if: :all_blank

  default_value_for(:task_date) {Date.today}

  def state_des
    ret = ""
    ret = "草稿(未处理)" if state.eql?("draft")
    ret = "已下发" if state.eql?("deliveried")
    ret = "进行中" if state.eql?("processing")
    ret = "已完成" if state.eql?("finished")
    ret
  end
end
