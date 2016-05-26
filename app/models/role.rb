#coding: utf-8
#角色
class Role < ActiveRecord::Base
  attr_accessor :all_role_sfos
  validates :name, presence: true
  has_many :users,through: :user_roles
  has_many :user_roles
  has_many :role_system_function_operates,-> {includes(:system_function_operate)},dependent: :destroy

  #is_select标志为true的role_system_function_operates
  has_many :selected_rsfos,-> {where(is_select: true)},class_name: "RoleSystemFunctionOperate"
  has_many :selected_sfos,->{includes(:system_function)},class_name:  "SystemFunctionOperate",through: :selected_rsfos,source: :system_function_operate
  has_many :system_function_operates,->{includes(:system_function)},through: :role_system_function_operates
  accepts_nested_attributes_for :role_system_function_operates,allow_destroy: true

  scope :with_association,->{includes(:role_system_function_operates,:system_function_operates)}

  #显示所有系统功能,包括当前角色具备的功能
  def all_role_system_function_operates!
    if all_role_sfos.blank?
      SystemFunctionOperate.where(:is_active => true).order("system_function_id").each do |sf_operate|
        role_system_function_operates.build(:system_function_operate => sf_operate) unless role_system_function_operates.detect { |the_rsf_op| the_rsf_op.system_function_operate_id == sf_operate.id }
      end
      all_role_sfos = role_system_function_operates
    end
    all_role_sfos
  end
  #根据系统功能得到对应的role_system_function_operate
  def single_function_operates(sf)
    all_role_system_function_operates!.select {|ops| ops.system_function_operate.system_function_id == sf.id}
  end

  def self.new_with_default(attributes = nil)
    role = Role.new(attributes)
    SystemFunctionOperate.where(:is_active => true).order("system_function_id").each do |sf_operate|
      role.role_system_function_operates.build(:system_function_operate => sf_operate)
    end
    role
  end
  #得到被授权的system_function
  def system_functions
    ids = selected_sfos.collect {|sfo| sfo.system_function_id}.uniq!
    if ids.blank?
      @system_finctions =[]
    else
      @system_functions ||= SystemFunction.includes(:system_function_group).where(id: ids,is_active: true)
    end
  end
  #得到被授权的system_function_group
  def system_function_groups
    @system_function_groups ||= system_functions.ransack(system_function_group_is_active_eq: true).result.group_by(&:system_function_group).sort_by {|k,v| k.order_by.present? ? k.order_by : 9999 }
  end
  #重写to_s方法
  def to_s
    name
  end
end
