class ApplicationController < ActionController::Base
  skip_before_action :authenticate_user!, only: :splash_screen, :raise => false
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar, { roles: [] }])
  end

  private 
  
  def splash_screen
    unless user_signed_in?
      redirect_to splash_screens_index_path
    end
  end
  

end
