#coding: utf-8
class User < ActiveRecord::Base
  attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  validates :user_name,:phone,:presence => true,uniqueness: {case_sensitive: false}
  has_many :user_favorites
  has_many :user_logs

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(user_name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      conditions[:email].downcase! if conditions[:email]
      where(conditions.to_hash).first
    end
  end

  def gender_des
    ret = ""
    ret = "男" if gender.eql?("m")
    ret = "女" if gender.eql?("f")
    ret
  end

end
