class ProjectsController < ApplicationController
  before_action :find_project!, only: %i[show edit update destroy]
  include ApplicationHelper

  def index
    @pagy, @projects = pagy(Project.all.order(created_at: :desc), items: 5)
    search_project_by_name
    search_project_by_status
    @projects = @projects.decorate
  end

  def show
    @project = @project.decorate
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params
    @project.update(user_id: current_user.id, launch_date: Date.today)

    # Такой вариант редиректа или вывода ошибки использован т.к. turbo-rails не "увидит" сообщений об ошибке
    # и не выведет их для конечного пользователя
    respond_to do |format|
      if @project.save
        # Флэш уведомление при успешном создании записи
        flash[:success]= "Проект #{@project.name} создан"
        format.html { redirect_to projects_path}
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
      if @project.update project_params
        # Флэш уведомление при успешном обновлении записи
        flash[:success]= "Проект #{@project.name} обновлен"
        format.html { redirect_to project_path}
      else
        format.html { render :edit, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    if @project.destroy!
      # Флэш уведомление при успешном удалении записи
      flash[:success]= "Проект #{@project.name} удален"
      redirect_to projects_path
    end
  end

  private

  # Проверка получение нужных параметров
  def project_params
    params.require(:project).permit([:name, :description, :homepage, :project_status_id])
  end

  # Поиск текущей нововсти
  def find_project!
    @project = Project.find(params[:id])
  end

  # Поиск проектов по имени
  def search_project_by_name
    if params[:search_project]
      @projects = @projects.where("name LIKE ?", "%#{params[:search_project].titleize}%")
    end
  end

  # Поиск проектов по статусу
  def search_project_by_status
    if params[:filter_status]
      @projects = @projects.where(project_status_id: params[:filter_status])
    end
  end
end
