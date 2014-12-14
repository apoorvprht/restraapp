class SessionsController < ApplicationController
	def create
		t_user = TwitterUser.from_omniauth(auth_hash)
		session[:t_user_id] = t_user.id
		redirect_to hotels_path, notice: "You have successfully Signed In"
	end

	def destroy
		session[:t_user_id] = nil
		redirect_to root_path, notice: "You have successfully Signed Out"
	end
  protected

  def auth_hash
   ActionController::Parameters.new(request.env["omniauth.auth"]).permit(:provider, :uid, info: [:nickname])
  end
end
