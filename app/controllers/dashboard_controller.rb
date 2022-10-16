class DashboardController < ApplicationController

	before_action :authenticate_user!

	def index
		@weak_passwords = current_user.passwords.where(pwd_strength: ["weak", "okay"])
		@num_weak_passwords = @weak_passwords.count
		@same_passwords = Password.get_password_v2(current_user).flatten
		@same_passwords_count = @same_passwords.count
		@security_score = Password.get_security_score(current_user)
		@progress_bar_color = progress_bar_color(@security_score)
	end

	def progress_bar_color security_score
		if security_score < 30
			"border-danger"
		elsif (security_score > 30) && (security_score < 50)
			"border-warning"
		elsif (security_score > 50) && (security_score < 80)
			"border-primary"
		else
			"border-success"
		end
	end


end