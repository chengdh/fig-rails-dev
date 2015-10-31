#coding: utf-8
class WebApp < ActiveRecord::Base
  validates :name,:form_el_username,:form_el_password,:form_method,:form_action, presence: true
end
