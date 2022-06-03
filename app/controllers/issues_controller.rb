class IssuesController < ApplicationController
  before_action :find_issue!, only: %i[show edit update destroy]
  include ApplicationHelper

  def index

    # Если есть id проекта вывод только задач из проекта
    if params[:project_id].present?
      @project = Project.current_project(params[:project_id])
      @pagy, @issues = pagy(Issue.where(project_id: params[:project_id]).order(created_at: :desc), items: 5)
    # Иначе вывод всех задач
    else
      @pagy, @issues = pagy(Issue.all.order(created_at: :desc), items: 5)
    end

    search_project_by_name
    search_project_by_status
    @issues = @issues.decorate
  end

  def show
    @project = Project.current_project(@issue.project_id)
    @issue = @issue.decorate
    @pagy, @journals = pagy(@issue.journals.order(created_at: :desc), items: 5)
    @journals = @journals.decorate
  end

  def new
    @users = User.active_user
    @project = Project.current_project(params[:project_id])
    @issue = @project.issues.build
    @issue = @issue.decorate
  end

  def create
    @project = Project.current_project(params[:project_id])
    @issue = @project.issues.build issue_params
    @issue.update(start_date: Date.today, author_id: current_user.id)

    # Такой вариант редиректа или вывода ошибки использован т.к. turbo-rails не "увидит" сообщений об ошибке
    # и не выведет их для конечного пользователя
    respond_to do |format|
      if @issue.save
        # Флэш уведомление при успешном создании записи
        flash[:success]= "Задача #{@issue.title} создана"
        format.html { redirect_to issue_path(@issue)}
      else
        format.html { render :new, status: :unprocessable_entity}
      end
    end
  end

  def edit
    @users = User.active_user
  end

  def update
    # Такой вариант редиректа или вывода ошибки использован т.к. turbo-rails не "увидит" сообщений об ошибке
    # и не выведет их для конечного пользователя
    respond_to do |format|
      if @issue.update issue_params
        # Флэш уведомление при успешном обновлении записи
        flash[:success]= "Задача #{@issue.title} обновлена"
        format.html { redirect_to issue_path(@issue)}
      else
        format.html { render :edit, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @project = Project.current_project(@issue.project_id)
    if @issue.destroy!
      # Флэш уведомление при успешном удалении записи
      flash[:success]= "Задача #{@issue.title} удалена"
      redirect_to project_issues_path(@project, @issue)
    end
  end

  private

  # Проверка получение нужных параметров
  def issue_params
    params.require(:issue).permit([:title, :description, :status_id, :assigned_to_id])
  end

  # Поиск текущей задачи
  def find_issue!
    @issue = Issue.find(params[:id])
  end

  # Поиск задач по имени
  def search_project_by_name
    if params[:issue].present?
      @issues = @issues.where("title LIKE ?", "%#{params[:issue][:title].titleize}%") if params[:issue][:title].present?
    end
  end

  # Поиск проектов по статусу
  def search_project_by_status
    if params[:issue].present?
      @issues = @issues.where(status_id: params[:issue][:status_id]) if params[:issue][:status_id].present?
    end
  end
end
