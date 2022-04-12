class NewsController < ApplicationController

  #def index
  #   @news = News.order('created_at DESC')
  # end

  def show
     @news = News.find(params[:id])
  end

  def new
    @news = News.new
  end

  def create
    @news = News.new news_params
    @news.save

    redirect_to home_path
  end

  def edit
    @news = News.find params[:id]
  end

  def update
    @news = News.find params[:id]
    @news.update! news_params
    redirect_to home_path
  end

  def destroy
    @news = News.find params[:id]
    @news.destroy!

    redirect_to home_path, status: :see_other
  end

  private

  def news_params
    params.require(:news).permit([:title, :description])
  end
end