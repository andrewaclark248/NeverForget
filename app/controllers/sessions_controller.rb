class SessionsController < Devise::SessionsController


	def new
		binding.pry
		super
		@login = Login.new
	end

  	def create
  		super
  	end


	def login_params
		params.require(:login).permit(:email, :password)
	end


end
