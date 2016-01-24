#coding: utf-8
class User < ActiveRecord::Base
  attr_accessor :all_user_orgs
  attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  validates :username,presence: true,uniqueness: {case_sensitive: false}
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, multiline: true
  belongs_to :default_org,class_name: "Org"
  belongs_to :default_role,class_name: "Role"
  has_many :user_roles
  has_many :roles,through: :user_roles
  has_many :user_orgs,-> {includes(:org)}
  has_many :orgs,through: :user_orgs
  accepts_nested_attributes_for :user_roles,:user_orgs,allow_destroy: true

  default_scope -> {includes(:default_role,:default_org)}


  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_hash).first
    end
  end
  def self.new_with_roles(attrs= {})
    ret = User.new(attrs)
    ret.all_user_roles!
    ret.all_user_orgs!
    ret
  end

  #显示所有部门,包括当前角色具备与不具备的部门
  def all_user_roles!
    Role.where(:is_active => true).each do |role|
      self.user_roles.build(:role => role) unless self.user_roles.detect { |the_user_role| the_user_role.role.id == role.id }
    end
    self.user_roles.to_a.select {|ur| ur.role.is_active?}
  end

  #显示所有部门,包括当前角色具备与不具备的部门
  def all_user_orgs!
    if all_user_orgs.blank?
      Org.where(:is_active => true).order("name ASC").each do |org|
        user_orgs.build(:org => org) unless user_orgs.detect { |the_user_org| the_user_org.org.id == org.id }
      end
      all_user_orgs ||= user_orgs.to_a.select {|uo| uo.org.is_active?}

    end
    all_user_orgs
  end


  #得到当前用户可访问的部门
  #如果是最末级机构,只可访问自己的数据,如果是上级机构,则可访问所有下级机构数据
  #FIXME 注意,当前只支持二级机构
  def current_ability_orgs
    [default_org] + default_org.children
  end

  def current_ability_org_ids
    current_ability_orgs.map {|org| org.id}
  end

  def to_s
    real_name
  end
end
