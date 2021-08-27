class ApplicationController < ActionController::Base
    
    before_action :authenticate_user!
    
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    protected

    def record_not_found
        flash[:danger] = "Room not found"
        redirect_to root_path
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :username])
    end
end
