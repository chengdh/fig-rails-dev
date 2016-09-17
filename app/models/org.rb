#coding: utf-8
#组织机构
class Org < ActiveRecord::Base
  validates :name, presence: true
  has_many :warehouses
  acts_as_tree order: "order_by"
  default_scope -> {includes(:children)}

  def self.root_org_id
    Org.find_by(parent_id: nil).id
  end
  def text
    name
  end
  def nodes
    children
  end
  #获取下级烟草专卖局
  def self.get_branch_ids
    child_names = %w(邓州市烟草专卖局 桐柏县烟草专卖局 方城县烟草专卖局
淅川县烟草专卖局 镇平县烟草专卖局 唐河县烟草专卖局
南召县烟草专卖局 内乡县烟草专卖局 新野县烟草专卖局
社旗县烟草专卖局 西峡县烟草专卖局 卧龙区烟草专卖局
宛城区烟草专卖局)
    self.where(name: child_names).pluck(:id)
  end

  def self.all_branch_ids
    branch_names = %w(南阳市烟草专卖局 邓州市烟草专卖局 桐柏县烟草专卖局 方城县烟草专卖局
淅川县烟草专卖局 镇平县烟草专卖局 唐河县烟草专卖局
南召县烟草专卖局 内乡县烟草专卖局 新野县烟草专卖局
社旗县烟草专卖局 西峡县烟草专卖局 卧龙区烟草专卖局
宛城区烟草专卖局)
    self.where(name: branch_names).pluck(:id)
  end

  def to_s
    ret = name
    if parent.present?
      ret = "#{parent.name}>#{name}"
    end
    ret
  end

  #递归获取所有子机构
  #递归获取所有子节点
  def get_all_children(ref_return)
    children.each do |c|
      ref_return.push(c)
      c.get_all_children(ref_return)
    end
  end
  def get_all_children_ids(ref_return)
    children.each do |c|
      ref_return.push(c.id)
      c.get_all_children(ref_return)
    end
  end

  #查找科室名称
  def find_child_by_name(children,match_name)
    children.find {|c| c.name.eql?(match_name)}
  end
end
