#coding: utf-8
class RegistrationsController < Devise::RegistrationsController
  respond_to :json
  protected
  def sign_up_params
     params.require(:user).permit!
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
