module Api
    class  Api::V1::CredentialsController < Api::V1::ApplicationController

        #get credentails
        #domain and auth_token as params
        def get_credentials
            domain = params[:domain]
            password_to_ref = nil

            @current_login.user.passwords.each do |password|
                password.urls.each do |url|
                    if domain[url.name]
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

        def add_credentials
            domain = params[:domain]
            username = params[:username]
            password = params[:password]

            password = Password.new(password: password, username: username, user: @current_login.user)
            url = Url.new(name: domain, password: password)

            if password.save && url.save
                render json: {success: "Added credentials and url"}
            else 
                render json: {error: "Error adding credentials and url"}
            end
        end

        def chrome_password_turned_off
            binding.pry
        end
        

    end
end