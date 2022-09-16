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


end