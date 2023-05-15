class UserPasswordsController < ApplicationController

	before_action :authenticate_user!


	def index
		binding.pry
		@passwords = current_login.user&.passwords.paginate(page: params[:page], per_page: 8)

		@number_of_pages = (@passwords.count/8.to_f).ceil
		@current_user = current_user
	end

	def new
		@password = Password.new
		@password.urls.build
	end

	def create
		password = Password.new(password_params)
		password.user = current_login.user

		if password.save
			flash[:notice] = "Password was created."
			redirect_to user_passwords_path
		else
      		flash[:error] = password.errors.full_messages.to_sentence
			  redirect_to new_user_password_path
		end
	end

	def edit
		@password = Password.find_by(id: params[:id])
		@rotate_password_text = "The 'Manually Rotate Password' button rotates your current password."
		@share_password_text = "Share your phone number with a contact!"
		@last_updated_at_text = "The last time your password was updated."
		render "edit4"
	end

	def update
		@password = Password.find_by(id: params[:id])
		updated_at = nil
		if @password.password != params["password"]["password"]
			updated_at = @password.updated_at
		else
			updated_at = DateTime.now
		end
		@password.updated_at = updated_at
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
			flash[:notice] = "Password was deleted."
			redirect_to user_passwords_path
		else
			flash[:error] = password.errors.full_messages.to_sentence
			redirect_to edit_user_password_path
	  end
	end

	def send_password_to_contact
		@client = Twilio::REST::Client.new("ACe94efa4a5bccafbcd7bf3d2d2f9166df", "829e5fa9183a5cce3c9b54c25aab5058")

		password = Password.find_by(id: params["id"])
		params["phoneNumber"]
		message = "Hello From Simple Logins, \n \n #{current_user.full_name} shared their credentials with you. See the credentials below. \n \n Username: #{password.username} \n \n Password: #{password.password} \n \n \n Thanks,\n SimpleLogins"
        message = @client.messages.create(
            body: message,
            from: "+18448837863",
            to: "3134602900" #params["phoneNumber"]
          )
        
        if message.error_message.nil?
            flash[:notice] = "Successfully sent credentials to contact."
            redirect_to user_passwords_path
        else
            flash[:error] = "Error sharing contact."
            redirect_to user_passwords_path
        end
	end


	def send_password_to_contact_via_email
		password = Password.find_by(id: params["id"].to_i)
		if password.present?
			recipient_email = params["password"]["share_password_email"]
			ApplicationMailer.send_password(recipient_email, password, current_user).deliver_now!
			flash[:notice] = "Password was sent to #{recipient_email}."
			redirect_to user_passwords_path
		else
      		flash[:error] = "Error sending password please contact support!"
      		redirect_to edit_user_password_path(password)
		end

	end

	private

		def password_params
			params.require(:password).permit(:password, :username, :pwd_strength, urls_attributes: [:name, :id, :_destroy])
		end

end