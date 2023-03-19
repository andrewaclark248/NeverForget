class PasswordsController < Devise::PasswordsController
	layout "login"


    def new
        super
    end

    def create
        binding.pry
    end
end