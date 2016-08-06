class ApplicationController < ActionController::Base
  respond_to :html,:json
  #before_action :authenticate_user!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  #参考http://stackoverflow.com/questions/38215274/devise-nomethoderror-for-parametersanitizer
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:user_name, :email, :password, :password_confirmation, :remember_me])
    devise_parameter_sanitizer.permit(:sign_in,keys: [:login, :user_name, :email, :password, :remember_me])
    devise_parameter_sanitizer.permit(:account_update,keys: [:user_name, :email, :password, :password_confirmation, :current_password])
  end
end
