class PasswordsController < Devise::PasswordsController
	layout "login"
    skip_before_action :verify_authenticity_token

    def new
        super
    end

    def create
        super
    end
end