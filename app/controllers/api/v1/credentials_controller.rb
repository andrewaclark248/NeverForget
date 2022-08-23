module Api
    class  Api::V1::CredentialsController < Api::V1::ApplicationController

        #get credentails
        #domain and auth_token as params
        def get_credentials
            domain = params[:domain]
            password_to_ref = nil
            @current_login.user.passwords.each do |password|
                password.urls.each do |url|
                    if domain[url.url].present?
                        password_to_ref = password
                        break
                    end
                end
            end
            if password_to_ref.nil?
                render json: {error: "Could Not Find Credentials"}
            else 
                render json: {username: password_to_ref.username, password: password_to_ref.password}

            end
        end
        

    end
end