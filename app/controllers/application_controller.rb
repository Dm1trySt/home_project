class ApplicationController < ActionController::Base
  # Проверка залогинился ли пользователь
  before_action :authenticate_user!
  include ErrorHandling
  include Pagy::Backend
end
