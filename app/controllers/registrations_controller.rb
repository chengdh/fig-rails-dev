#coding: utf-8
class RegistrationsController < Devise::RegistrationsController
  def sign_up_params
     params.require(:user).permit!
  end
end
