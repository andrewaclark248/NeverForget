class ApplicationController < ActionController::Base

	#before_action :authenticate_user!
  	add_flash_types :info, :error, :success

	def current_user
		return current_login.user
	end


end
