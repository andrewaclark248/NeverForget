require 'jwt'

class SessionsController < Devise::SessionsController
	layout "login"

	
	def new
		super
	end

  	def create
  		super
  		add_jwt
  	end

  	def add_jwt
		num_weeks = current_login.user.chrome_ext_auto_logoff.to_i
		exp = Time.now.to_i + num_weeks.weeks.to_i
		user_name = current_login.email
		exp_payload = { data: user_name, exp: exp }
		token = JWT.encode exp_payload, nil, 'none'
		cookies[:auth_token] = token
		current_login.update(auth_token: token)
  	end

end
