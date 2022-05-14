module ErrorHandling
  extend ActiveSupport::Concern
  included do
    # Обработка ошибки "страница не найдена"
    rescue_from ActiveRecord::RecordNotFound, with: :notfound

    private

    # Вывод странциы, если запрашиваемая страница не найдена
    def notfound(exception)
      logger.warn exception
      # Рендер страницы 404 со статусом "не найден" без макета
      render file: 'public/404.html', status: :not_found, layout:  false
    end
  end
end