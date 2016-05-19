#coding: utf-8
class RegistrationsController < Devise::RegistrationsController
  def sign_up_params
     params.require(:user).permit!
  end

  protected
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
