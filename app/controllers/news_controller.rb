class NewsController < ApplicationController

  before_action :find_news!, only: %i[show edit update destroy]

  def index
    @pagy, @news = pagy(News.order(created_at: :desc), items: 5)
  end

  def show
  end

  def new
    @news = News.new
  end

  def create
    @news = News.new news_params
    # Такой вариант редиректа или вывода ошибки использован т.к. turbo-rails не "увидит" сообщений об ошибке
    # и не выведет их для конечного пользователя
    respond_to do |format|
      if @news.save
        # Флэш уведомление при успешном создании записи
        flash[:success]= "Новость создана"
        format.html { redirect_to home_path}
      else
        format.html { render :new, status: :unprocessable_entity}
      end
    end
  end

  def edit
  end

  def update
    # Такой вариант редиректа или вывода ошибки использован т.к. turbo-rails не "увидит" сообщений об ошибке
    # и не выведет их для конечного пользователя
    respond_to do |format|
      if @news.update news_params
        # Флэш уведомление при успешном обновлении записи
        flash[:success]= "Новость #{@news.title} обновлена"
        format.html { redirect_to home_path}
      else
        format.html { render :edit, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    if @news.destroy!
      # Флэш уведомление при успешном удалении записи
      flash[:success]= "Новость #{@news.title} удалена"
      redirect_to home_path
    end
  end

  private

  # Проверка получение нужных параметров
  def news_params
    params.require(:news).permit([:title, :description])
  end

  # Поиск текущей нововсти
  def find_news!
    @news = News.find(params[:id])
  end
end