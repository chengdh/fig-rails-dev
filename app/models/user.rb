#coding: utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
          #:registerable,:recoverable,
          :rememberable, :trackable,
          #:validatable,
          :authentication_keys => [:login]
  has_many :user_web_apps
  has_many :web_apps,through: :user_web_apps
  validates :username,:presence => true,:uniqueness => {:case_sensitive => false}
  accepts_nested_attributes_for :user_web_apps

  attr_accessor :login

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions.to_hash).first
      end
  end
end