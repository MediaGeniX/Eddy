class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |e|
    flash[:error] = e.message
    redirect_to root_path
  end

  # If your model is called User
  def after_sign_in_path_for(resource)
    session["user_return_to"] || root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in)
    devise_parameter_sanitizer.permit(:sign_up, keys: additional_devise_parameters)
    devise_parameter_sanitizer.permit(:account_update, keys: additional_devise_parameters)
  end

  private

  def additional_devise_parameters
    [ :name, :birthdate, :location, :sex ]
  end
end
