class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
   include SimpleCaptcha::ControllerHelpers
  protect_from_forgery with: :exception
   def after_sign_in_path_for(resource)
    "/show_map"
  end

  protected
    
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password) }
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit( :email, :password, :password_confirmation, :captcha, :captcha_key) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit( :email, :password, :password_confirmation, :current_password) }
    end
private
	
	def current_user
		@current_user ||= TwitterUser.find(session[:t_user_id]) if session[:t_user_id]
	end
	helper_method :current_user
end
