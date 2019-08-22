class ApplicationController < ActionController::Base

  before_action :set_raven_context

  before_action :update_current_user

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def set_raven_context
    Raven.user_context(id: session[:current_user_id]) # or anything else in session
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end

  def update_current_user
    current_user.reload
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :cellphone, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :cellphone, :email, :password, :current_password)}
  end

end
