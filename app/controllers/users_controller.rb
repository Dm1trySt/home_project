class UsersController < ApplicationController
  #before_action :require_admin
  include ApplicationHelper

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
end