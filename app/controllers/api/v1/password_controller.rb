module Api
    class  Api::V1::PasswordController < Api::V1::ApplicationController

        def index
            urls = {}
            urls = @current_login.user.passwords.map(&:urls).flatten
            urls = urls.flatten
            urls = urls.pluck(:name)

            passwords = {}
            @current_login.user.passwords.map do |password|
                password.urls.each do |url|
                    passwords[url.name] = {username: password.username, password: password.password}
                end
            end
            render json: {urls: urls, passwords: passwords}
        end

        def create
            password = Password.new(password: params["password"]["password"], username: params["password"]["username"], user: @current_login.user)
            password.save
            url = Url.new(name: params["password"]["domain"], password: password)
            url.save
            render json: {success: true}
        end

    end

end