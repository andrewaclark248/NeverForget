class ApplicationController < ActionController::Base

	protect_from_forgery with: :exception

  	add_flash_types :info, :error, :success
	
	skip_before_action :verify_authenticity_token

	#before_action :configure_permitted_parameters, if: :devise_controller?

	def current_user
		return current_login&.user
	end

	def authenticate_user!
		if current_user.blank?
			redirect_to new_login_session_path and return
		end
	end


	def configure_permitted_parameters
		#devise_parameter_sanitizer.permit(:sign_in, keys: [:otp_attempt])
	  end

end
