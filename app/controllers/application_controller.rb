class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  # http://localhost:3000/prototypes/new
  # http://localhost:3000/prototypes/5/edit

  before_action :configure_permmited_parameters, if: :devise_controller?

  private
  def configure_permmited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :occupation, :position])
  end
end
