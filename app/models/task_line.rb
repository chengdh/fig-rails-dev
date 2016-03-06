#coding: utf-8
class TaskLine < ActiveRecord::Base
  belongs_to :task
  belongs_to :user

  default_value_for(:line_date) {Date.today}
  default_scope {order("line_date DESC")}
  validates :note,:user_id, presence: true
end
