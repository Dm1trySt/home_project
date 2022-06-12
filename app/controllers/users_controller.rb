class UsersController < ApplicationController
  #before_action :require_admin
  include ApplicationHelper

  before_action :find_user!, only: %i[edit update destroy]

  def index
    # Варианты ответов на разные форматы
    respond_to do |format|
      # Вариант ответа на html
      format.html do
        @pagy, @users = pagy User.all
      end
      # Вариант ответа на формат zip
      format.zip { respond_with_zipped_users }
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
  def respond_with_zipped_users
    # создание временного архива для передачи данных
    compressed_filestream = Zip::OutputStream.write_buffer do |zos|
      # Создание архива для каждого пользователя
      users = User.all
      # Формат, который будет храниться в архиве
      zos.put_next_entry "users.xlsx"
      # Запись данных
      zos.print render_to_string(
                  handlers: [:axlsx], formats: [:xlsx], template: 'users/user', locals:{users: users}
                )

    end
    # Возврат в начало данных
    compressed_filestream.rewind

    send_data compressed_filestream.read, filename: 'users.zip'
  end

  def find_user!
    @user = User.find(params[:id])
    @user = @user.decorate
  end

  # Проверка получение нужных параметров
  def user_params
    params.require(:user).permit([:name, :admin, :active, :role_id]) if current_user.admin?
  end
end