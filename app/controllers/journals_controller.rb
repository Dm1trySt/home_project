class JournalsController < ApplicationController
  before_action :set_journal!, except: [:new, :create]
  before_action :set_issue!

  def new
    @journal = @issue.journals.build
    @journal = @journal.decorate
  end

  def create
    @journal = @issue.journals.build journal_params
    @journal.user_id = current_user.id
    @journal = @journal.decorate

    if @journal.save
      flash[:success]= "Комментарий создан"
      redirect_to issue_path(@issue)
    else
      flash[:error]= "Комментарий  не создан"
      redirect_to new_issue_journal_path(@issue), status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    # Такой вариант редиректа или вывода ошибки использован т.к. turbo-rails не "увидит" сообщений об ошибке
    # и не выведет их для конечного пользователя
    respond_to do |format|
      if @journal.update journal_params
        # Флэш уведомление при успешном обновлении записи
        flash[:success]= "Комментарий обновлен"
        format.html { redirect_to issue_path(@issue)}
      else
        format.html { render :edit, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    if @journal.destroy
      flash[:success]= "Комментарий удален"
      redirect_to issue_path(@issue)
    end
  end

  private

  # Проверка получение нужных параметров
  def journal_params
    params.require(:journal).permit([:body])
  end

  # Поиск текущего комментария
  def set_journal!
    @journal = Journal.find params[:id]
    @journal.decorate
  end

  # Поиск текущей задачи
  def set_issue!
    @issue = params[:issue_id].present? ? (Issue.find params[:issue_id]) : @journal.issue
  end
end
