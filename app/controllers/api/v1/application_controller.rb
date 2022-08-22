module Api
  class ApplicationController < ActionController::Base

  	before_action :authenticate


  	def authenticate
		@current_login = Login.find_by(auth_token: api_params[:auth_token])
		if @current_login.nil?
			render json {error: "Invalid Login"}
		end
  	end

  	private
  		def api_params
  			params.permit(:auth_token)
  		end

  end
end