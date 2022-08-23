module Api
  class  Api::V1::ApplicationController < ActionController::Base

  	before_action :authenticate


  	def authenticate
		auth_token = request.headers['Authorization'].split(" ").second

		if auth_token.nil?
			render json: {error: "Invalid Login"}
			return
		end

		@current_login = Login.find_by(auth_token: auth_token)
		if @current_login.nil?
			render json: {error: "Invalid Login"}
		end
  	end

  	private
  		def api_params
  			params.permit(:auth_token)
  		end

  end
end