class LoginController < ApplicationController

	layout "login"

	def register

	end

	def login
		render "login"
		#render layout: 'login'
	end


end
