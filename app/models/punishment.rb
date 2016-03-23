#coding: utf-8
#处罚情况
class Punishment < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  belongs_to :poster,class_name: "User"
  belongs_to :punish_org,class_name: "Org"

  default_scope {order("table_date DESC")}
  default_value_for(:table_date) {Date.today}
  default_value_for(:punish_date) {Date.today}

  validates :org_id,:name,:table_date,:user_id,:note, presence: true

  def check_state_des
    ret = ""
    ret = "草稿(未发布)" if check_state.eql?("draft")
    ret = "已发布" if check_state.eql?("confirmed")
    ret
  end

end
