module Api
    class  Api::V1::PasswordController < Api::V1::ApplicationController

        def index
            urls = @current_login.user.passwords.map(&:urls).flatten
            urls = urls.flatten
            urls = urls.pluck(:name)
            render json: {urls: urls}
        end

        def create
            password = Password.new(password: params["password"], username: params["username"], user: @current_login.user)
            password.save
            url = Url.new(name: params["domain"], password: password)
            url.save
            render json: {success: "success"}

        end

    end

end