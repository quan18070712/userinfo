class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,
        keys: [:username, :name, :email, :password, :password_confirmation])
      devise_parameter_sanitizer.permit(:sign_in,
        keys: [:login, :password, :password_confirmation])
      devise_parameter_sanitizer.permit(:account_update,
        keys: [:username, :name, :email, :password_confirmation, :current_password])
    
      # devise_parameter_sanitizer.for(:sign_up) 
      #   {|u| u.permit(:name, 
      #                 :email, 
      #                 :password_confirmation)}
      # devise_parameter_sanitizer.for(:sign_in) 
      #   {|u| u.permit(:login, 
      #                 :password, 
      #                 :password_confirmation)}
      # devise_parameter_sanitizer.for(:account_update) 
      #   {|u| u.permit(:name, 
      #                 :email, 
      #                 :password_confirmation, 
      #                 :current_password)}
    end
end
