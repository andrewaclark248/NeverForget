require 'jwt'

class SessionsController < Devise::SessionsController

	
	def new
		super
	end

  	def create
  		super
  		add_jwt
  	end

  	def add_jwt
  		user_name = current_login.email
  		payload = { data: user_name }
		token = JWT.encode payload, nil, 'none'
		cookies[:auth_token] = token
		current_login.update(auth_token: token)
  	end

end
