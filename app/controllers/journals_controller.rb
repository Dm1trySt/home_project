class JournalsController < ApplicationController
  before_action :set_issue!

  def new
    @journal = @issue.journals.build
    @journal = @journal.decorate
  end

  def create
    @journal = @issue.journals.build issue_params
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
    @journal = @issue.journals.find params[:id]
  end

  def update
    @journal = @issue.journals.find params[:id]
       if @journal.update issue_params
         # Флэш уведомление при успешном обновлении записи
         flash[:success]= "Комментарий обновлен"
         redirect_to issue_path(@issue)
       else
         redirect_to edit_issue_journal_path(@issue,@journal), status: :unprocessable_entity
       end
  end

  def destroy
    journal = @issue.journals.find params[:id]
    if journal.destroy
      flash[:success]= "Комментарий удален"
      redirect_to issue_path(@issue)
    end
  end

  private

  # Проверка получение нужных параметров
  def issue_params
    params.require(:journal).permit([:body])
  end

  # Поиск текущей задачи
  def set_issue!
    @issue = Issue.find params[:issue_id]
  end
end
