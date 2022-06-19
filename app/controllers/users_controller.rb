class UsersController < ApplicationController
  #before_action :require_admin
  include ApplicationHelper

  before_action :authorize_user!
  after_action :verify_authorized
  before_action :find_user!, only: %i[edit update destroy]

  def index
    # Варианты ответов на разные форматы
    respond_to do |format|
      @users = User.all
      # Вариант ответа на html
      format.html do
        @pagy, @users = pagy(@users, items: 15)
      end
      # Вариант ответа на формат xlsx
      format.xlsx {render xlsx: 'user',filename: "users.xlsx"}
    end
  end

  def edit
  end

  def update
    # Такой вариант редиректа или вывода ошибки использован т.к. turbo-rails не "увидит" сообщений об ошибке
    # и не выведет их для конечного пользователя
    respond_to do |format|
      if @user.update user_params
        # Флэш уведомление при успешном обновлении записи
        flash[:success]= "Пользователь #{@user.name_or_email} обновлен"
        format.html { redirect_to users_path}
      else
        format.html { render :edit, status: :unprocessable_entity}
      end
    end
  end

  private

  def find_user!
    @user = User.find(params[:id])
    @user = @user.decorate
  end

  # Проверка получение нужных параметров
  def user_params
    params.require(:user).permit([:name, :admin, :active, :role_id])
  end

  def authorize_user!
    authorize(@user || User)
  end

end