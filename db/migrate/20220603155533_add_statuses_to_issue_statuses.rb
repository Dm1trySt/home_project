class AddStatusesToIssueStatuses < ActiveRecord::Migration[7.0]
  def change
    statuses =[
      { name: 'Новый' },
      { name: 'Назначен' },
      { name: 'Заблокирован' },
      { name: 'Обратная связь' },
      { name: 'Закрыт' },
      { name: 'Отказ' },
      { name: 'В работе' },
      { name: 'Исполнено' }
    ]
    statuses.each do |status|
      IssueStatus.create status
    end
  end
end
