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


end