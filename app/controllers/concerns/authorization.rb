module Authorization
  extend ActiveSupport::Concern

  included do
    include Pundit
    # "Отлов" ошибки Pundit::NotAuthorizedError
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private

    # Возврат на домашнюю страницу с сообщением
    def user_not_authorized
      flash[:danger] = "У Вас нет прав для выполнения данного действия"
      redirect_to(request.referer || home_path)
    end
  end
end
