class LoginController < Devise::SessionsController

	layout "login"

	def register
	end

	def login
	end

	def login_params
		params.require(:user).permit(:email, :password)
	end


end
