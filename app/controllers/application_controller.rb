class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  private

  def after_sign_in_path_for(resource)
    if resource.class == User
      user_path(resource)
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :birth_date])
  end
end
