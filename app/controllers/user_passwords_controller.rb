class UserPasswordsController < ApplicationController

	def index
		@passwords = current_login.user&.passwords
	end

	def new
		@password = Password.new
		@password.urls.build
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
		@password = Password.find_by(id: params[:id])
		@rotate_password_text = "The 'Manually Rotate Password' button rotates your current password."
	end

	def update
		@password = Password.find_by(id: params[:id])
		if @password.update(password_params)
			flash[:notice] = "Password was updated."
			redirect_to user_passwords_path
		else
      		flash[:error] = @password.errors.full_messages.to_sentence
      		redirect_to edit_user_password_path
		end
	end

	def destroy
		password = Password.find_by(id: params[:id])
		if password.destroy
			flash[:notice] = "Password was updated."
			redirect_to user_passwords_path
		else
			flash[:error] = password.errors.full_messages.to_sentence
			redirect_to edit_user_password_path
	  end
	end

	private

		def password_params
			params.require(:password).permit(:password, :username, urls_attributes: [:name, :id, :_destroy])
		end

end