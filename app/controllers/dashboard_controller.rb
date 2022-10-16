class DashboardController < ApplicationController

	before_action :authenticate_user!

	def index
		@weak_passwords = current_user.passwords.where(pwd_strength: ["weak", "okay"])
		@num_weak_passwords = @weak_passwords.count
		#number_of_passwords_that_are_same = Password.get_password_v2(current_user)
		#binding.pry
	end


end