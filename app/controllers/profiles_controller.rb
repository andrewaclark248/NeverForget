class ProfilesController < ApplicationController

    before_action :authenticate_user!

    def index
        @user = current_user
    end

    def update_login
        first = params[current_user.type.downcase]["first"]
        last = params[current_user.type.downcase]["last"]
        chrome_ext_auto_logoff = params[current_user.type.downcase]["chrome_ext_auto_logoff"]

        if current_user.update(first: first, last: last, chrome_ext_auto_logoff: chrome_ext_auto_logoff)
            flash[:notice] = "Profile was updated."
            redirect_to profiles_path  
        else
            flash[:error] = "Error updating your profile."
            redirect_to profiles_path  
        end
    end

    def configure_mfa
        mfa_enabled = (params[current_user.type.downcase]["mfa_enabled"] == "mfa_enabled") ? true : false
        if !mfa_enabled &&  
            current_login.update(otp_required_for_login: mfa_enabled)
            flash[:notice] = "MFA was set to disabled for your profile!"
            redirect_to profiles_path  
        end
        mfa_send_option = params[current_user.type.downcase]["mfa_send_option"]
        mfa_email = params[current_user.type.downcase]["mfa_email"]
        mfa_phone = params[current_user.type.downcase]["mfa_phone"].delete "()-"
        
        current_login.otp_required_for_login = mfa_enabled
        current_login.mfa_send_option = mfa_send_option
        current_login.otp_secret = Login.generate_otp_secret

        if mfa_send_option == "email"
            current_login.mfa_email = mfa_email
        else
            current_login.mfa_phone = mfa_phone
        end

        if current_login.save
            flash[:notice] = "MFA Options were udpated."
            redirect_to profiles_path  
        else
            flash[:error] = "Error updating MFA options. Please contact support."
            redirect_to profiles_path  
        end      
    end

end