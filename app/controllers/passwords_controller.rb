class PasswordsController < Devise::PasswordsController
	layout "login"


    def new
        binding.pry
        super
    end
end