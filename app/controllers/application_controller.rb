class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  after_action :verify_authorized, except: :index, unless: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?


  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

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

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action"
    redirect_to request.headers["Referer"] || root_path
  end

  def additional_devise_parameters
    [ :name, :birthdate, :location, :sex ]
  end
end
