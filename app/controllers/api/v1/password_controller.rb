module Api
    class  Api::V1::PasswordController < Api::V1::ApplicationController

        def index
            urls = @current_login.user.passwords.map(&:urls).flatten
            urls = urls.flatten
            urls = urls.pluck(:name)
            render json: {urls: urls}

        end

    end

end