module Api
    class  Api::V1::CredentialsController < ApplicationController

        #get credentails
        #domain and auth_token as params
        def get_credentials
            password = @current_login.user.passwords.joins(:urls).where(urls: {url: "url2.com"})
            render json: {username: "data122222", password: "dadtasdflfaf"}
        end
        

    end
end