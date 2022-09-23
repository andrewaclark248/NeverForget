class ProfilesController < ApplicationController

    before_action :authenticate_user!

    def index
        @login = current_login
    end

    def update_login
    end


end