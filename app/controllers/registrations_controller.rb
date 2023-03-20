class RegistrationsController < Devise::RegistrationsController

    layout "login"

    before_action :configure_permitted_parameters, if: :devise_controller?
    skip_before_action :verify_authenticity_token


    def new
        super
    end

    def create
        #super
        login = Login.create(login_params)
        if login.save  
            sign_in login
            #render status: 200, json: { success: true }
        else
            render status: :unauthorized, json: { success: false }
        end
    end
    
    def login_params
        params.require(:login).permit(:first_name, :last_name, :password, :email)
    end
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email])
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone, :email])
    end
end