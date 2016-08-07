#coding: utf-8
#组织机构
class Org < ActiveRecord::Base
  validates :name, presence: true
  acts_as_tree order: "order_by"
  has_many :warehouses

  def self.root_org_id
    Org.find_by(parent_id: nil).id
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
end
