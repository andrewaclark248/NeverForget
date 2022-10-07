class PasswordsController < Devise::PasswordsController

    def edit
        super
        binding.pry

    end


    def update
        super
        binding.pry
    end

end