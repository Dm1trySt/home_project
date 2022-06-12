class RolesController < ApplicationController
  before_action :find_roles!, only: %i[show edit update destroy]
  include ApplicationHelper

  def index
    @pagy, @roles = pagy(Role.all, items: 10)
    search_roles_by_name
    # @roles = @roles.decorate
  end

  def show
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new role_params
    # Такой вариант редиректа или вывода ошибки использован т.к. turbo-rails не "увидит" сообщений об ошибке
    # и не выведет их для конечного пользователя
    respond_to do |format|
      if @role.save
        # Флэш уведомление при успешном создании записи
        flash[:success]= "Роль #{@role.name} создана"
        format.html { redirect_to role_path(@role)}
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
      if @role.update role_params
        # Флэш уведомление при успешном обновлении записи
        flash[:success]= "Роль #{@role.name} обновлена"
        format.html { redirect_to role_path(@role)}
      else
        format.html { render :edit, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    if @role.destroy!
      # Флэш уведомление при успешном удалении записи
      flash[:success]= "Роль #{@role.name} удалена"
      redirect_to roles_path
    end
  end

  private

  # Проверка получение нужных параметров
  def role_params
    params.require(:role).permit([:name])
  end

  # Поиск ролей по имени
  def search_roles_by_name
    if params[:name]
      @roles = @roles.where("name LIKE ?", "%#{params[:name].titleize}%")
    end
  end

  # Поиск текущей нововсти
  def find_roles!
    @role = Role.find(params[:id])
  end
end
