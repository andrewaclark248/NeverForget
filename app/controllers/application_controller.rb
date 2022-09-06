class ApplicationController < ActionController::Base


  	add_flash_types :info, :error, :success

	def current_user
		return current_login&.user
	end

	def authenticate_user
		if current_user.blank?
			redirect_to new_login_session_path and return
		end
	end

end
