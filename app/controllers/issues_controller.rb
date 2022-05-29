class IssuesController < ApplicationController
  before_action :find_issue!, :set_project!, only: %i[show edit update destroy]
  include ApplicationHelper

  def index
    @project = set_project!
    @pagy, @issues = pagy(Issue.where(project_id: params[:project_id]).order(created_at: :desc), items: 5)
    @current_project = Project.find params[:project_id]
    @users = User.name_and_email
    #search_project_by_name
    #search_project_by_status
    @issues = @issues.decorate
    #@project_statuses = ProjectStatus.actual_project_statuses
  end

  def show
    @project = set_project!
    @issue = @issue.decorate
  end

  def new
    @project = set_project!
    @issue = @current_project.issues.build
    @issue = @issue.decorate
  end

  def create
    @project = set_project!
    @issue = @project.issues.build issue_params
    @issue.update(start_date: Date.today)

    # Такой вариант редиректа или вывода ошибки использован т.к. turbo-rails не "увидит" сообщений об ошибке
    # и не выведет их для конечного пользователя
    respond_to do |format|
      if @issue.save
        # Флэш уведомление при успешном создании записи
        flash[:success]= "Задача #{@issue.title} создана"
        format.html { redirect_to project_issue_path(@project, @issue)}
      else
        format.html { render :new, status: :unprocessable_entity}
      end
    end
  end

  def edit
    @project = set_project!
  end

  def update
    #@project = set_project!
    # Такой вариант редиректа или вывода ошибки использован т.к. turbo-rails не "увидит" сообщений об ошибке
    # и не выведет их для конечного пользователя
    respond_to do |format|
      if @issue.update issue_params
        # Флэш уведомление при успешном обновлении записи
        flash[:success]= "Задача #{@issue.title} обновлена"
        format.html { redirect_to project_issue_path(set_project!, @issue)}
      else
        format.html { render :edit, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    if @issue.destroy!
      # Флэш уведомление при успешном удалении записи
      flash[:success]= "Задача #{@issue.title} удалена"
      redirect_to project_issues_path(set_project!, @issue)
    end
  end

  private

  # Проверка получение нужных параметров
  def issue_params
    params.require(:issue).permit([:title, :description, :status_id])
  end

  # Поиск текущей задачи
  def find_issue!
    @issue = Issue.find(params[:id])
  end

  # Текущий проект
  def set_project!
    @current_project = Project.find params[:project_id]
  end

  # Поиск задач по имени
  def search_project_by_name
    if params[:project_name]
      @projects = @projects.where("name LIKE ?", "%#{params[:project_name].titleize}%")
    end
  end

  # Поиск проектов по статусу
  def search_project_by_status
    if params[:status_id].present?
      @projects = @projects.where(project_status_id: params[:status_id])
    end
  end
end
