class PasswordsController < Devise::PasswordsController

    layout "login"

    def edit
        super
    end

    def new
        super
    end
    

end