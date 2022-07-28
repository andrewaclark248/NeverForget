class SessionsController < Devise::SessionsController


	def new
		binding.pry

		x = 2
		super
		@login = Login.new
	end

  	def create
  		x = 1
  		binding.pry
  		super
  	end


end
