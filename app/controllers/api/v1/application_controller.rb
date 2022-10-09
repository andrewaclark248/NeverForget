module Api
  class  Api::V1::ApplicationController < ActionController::Base

  	before_action :authenticate

	skip_before_action :verify_authenticity_token  



  	def authenticate
		#get auth token
		auth_token = request.headers['Authorization'].split(" ").second
		if auth_token.nil?
			render json: {error: "Invalid Login"}
			return
		end

		#get auth token and find user
		@current_login = Login.find_by(auth_token: auth_token)
		
		if @current_login.nil?
			render json: {error: "Invalid Login"}
		end

		#validate JWT via for not expired
		begin
			decoded_token = JWT.decode auth_token, nil, true, { algorithm: 'none' }
		rescue JWT::ExpiredSignature
			render json: {error: "Need to login again!"}

			# Handle expired token, e.g. logout user or deny access
		end
  	end

  	private
  		def api_params
  			params.permit(:auth_token)
  		end

  end
end