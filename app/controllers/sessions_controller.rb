class SessionsController < Devise::SessionsController
	
	
	def new
		super
		@login = Login.new
	end

  	def create
  		x = 1
  		super
  	end


end
