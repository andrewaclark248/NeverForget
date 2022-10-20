require 'jwt'

class SessionsController < Devise::SessionsController
	layout "login"
	include AuthenticateWithOtpTwoFactor

	prepend_before_action :authenticate_with_otp_two_factor,
	if: -> { action_name == 'create' && otp_two_factor_enabled? }

	def new
		super
	end

  	def create
		if true#Rails.env.production? || Rails.env.staging?
			result = BlockTorIpAddress.call(ip_address: request.remote_ip)
			if result.failure?
				flash[:error] = "You have logged in from a invalid devise. Please adjust your settings if you would like to fix this."
				redirect_to root_path
				return
			end
		end
  		super
  		add_jwt
  	end

  	def add_jwt
		num_weeks = current_login.user.chrome_ext_auto_logoff.to_i
		exp = Time.now.to_i + num_weeks.weeks.to_i
		user_name = current_login.email
		exp_payload = { data: user_name, exp: exp }
		token = JWT.encode exp_payload, nil, 'none'
		cookies[:auth_token] = token
		current_login.update(auth_token: token)
  	end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:otp_attempt])
  end

end
