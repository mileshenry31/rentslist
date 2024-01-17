class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    respond_to :html, :json

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :zip_code])
    end
end
