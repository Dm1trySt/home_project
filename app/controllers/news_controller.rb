class NewsController < ApplicationController

  def show
     @news = News.find(params[:id])
  end

  def new
    @news = News.new
  end

  def create
    @news = News.new news_params
    respond_to do |format|
      if @news.save
        format.html { redirect_to home_path, notice: "Text" }
        format.json { render :index, status: :created, locate: home_path}
      else
        format.html { render :new, status: :unprocessable_entity}
        format.json { render json: @news.errors, status: :unprocessable_entity}
      end
    end
  end

  def edit
    @news = News.find params[:id]
  end

  def update
    @news = News.find params[:id]
    respond_to do |format|
      if @news.update news_params
        format.html { redirect_to home_path, notice: "Text" }
        format.json { render :index, status: :created, locate: home_path}
      else
        format.html { render :edit, status: :unprocessable_entity}
        format.json { render json: @news.errors, status: :unprocessable_entity}
      end
    end
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