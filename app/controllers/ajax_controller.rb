class AjaxController < ApplicationController

	#before_action :authenticate_user!

	def get_new_password
		password = Passgen::generate(:length => 25, symbols: true)
        if password.present?
            render json: {password: password}
        else 
            Rails.logger.error("Some error")
        end
	end

    def get_password
        password = Password.find_by(id: params[:id])
        if password.present?
            render json: {password: password.password, username: password.username}
        else 
            Rails.logger.error("Some error")
        end
    end

    def get_key
        key = Key.find_by(id: params[:id])
        if key.present?
            render json: {key: key.key, value: key.value}
        else 
            Rails.logger.error("Some error")
        end
    end

    def send_test_email
        if params["email"].present?
            ApplicationMailer.email_change(params["email"]).deliver_now!
            render json: {success: "true"}
        else 
            Rails.logger.error("Some error")
        end
    end


end