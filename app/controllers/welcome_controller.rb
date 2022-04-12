class WelcomeController < ApplicationController
  def index
    # Получение свежих новостей для home
    @news = News.latest
  end

end
