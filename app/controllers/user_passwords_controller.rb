class UserPasswordsController < ApplicationController

	def index
		@passwords = current_login.user.passwords
	end

	def new
		@password = Password.new
	end

	def create
		password = Password.new(password_params)
		password.user = current_login.user

		if password.save!
			flash[:notice] = "Password was created."
			redirect_to user_passwords_path
		else
      		flash[:error] = password.errors.full_messages.to_sentence
      		render :new
		end
	end

	def edit
		@user_password = Password.find_by(id: params[:id])
	end

	def update
		password = Password.find_by(id: params[:id])
		#password.update!(password: password_params[:password])
		#if
	end


	private

		def password_params
			params.require(:password).permit(:password, :get_urls)
		end

end