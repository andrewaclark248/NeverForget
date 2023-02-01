class RegistrationsController < Devise::RegistrationsController

    layout "login"

    before_action :configure_permitted_parameters, if: :devise_controller?


    def new
        super
    end

    def create
        super
    end
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email])
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone, :email])
    end

    private

    def after_sign_up_path_for(resource)
        "/logins/sign_in"
      end
end