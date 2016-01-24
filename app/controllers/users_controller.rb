#coding: utf-8
class UsersController < BaseController
  table :username,:real_name,:is_active,:is_admin,:default_org_id,:default_role_id,:current_sign_in_at,:last_sign_in_at,:current_sign_in_ip,:last_sign_in_ip
end
