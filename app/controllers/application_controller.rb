class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  respond_to? :json




    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password,  :image, :image_cache) }
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :current_password, :image, :image_cache, :remove_image) }
        end

end
