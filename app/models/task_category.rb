#coding: utf-8
#任务分类
class TaskCategory < ActiveRecord::Base
  validates :name, presence: true
  def to_s ; name ; end
end
