class DashboardController < ApplicationController

	def index
		@number_of_passwords = current_user.passwords.count
		@number_of_phones = current_user.phones.count
	end


end