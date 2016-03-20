class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in)
    devise_parameter_sanitizer.for(:sign_up).concat(additional_devise_parameters)
    devise_parameter_sanitizer.for(:account_update).concat(additional_devise_parameters)
  end

  private

  def additional_devise_parameters
    [ :name, :birthdate, :location, :sex ]
  end
end
