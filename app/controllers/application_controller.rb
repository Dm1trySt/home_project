class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  # Проверка залогинился ли пользователь
  before_action :authenticate_user!
  include ErrorHandling
  include Pagy::Backend

  # Поиск текущего пользователя с помощью гема Devise
  def devise_current_user
    @devise_current_user ||= warden.authenticate(scope: :user).decorate
  end

  # Текущий пользователь
  def current_user
    if params[:user_id].blank?
      devise_current_user
    else
      User.find(params[:user_id]).decorate
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
