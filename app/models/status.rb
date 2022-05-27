class Status < ApplicationRecord
  NEW_ID              = 1   # Новый
  ASSIGNED_ID         = 2   # Назначен
  BLOCKED_ID          = 3   # Заблокирован
  NEED_FEEDBACK_ID    = 4   # Обратная связь
  CLOSED_ID           = 5   # Закрыт
  REJECTION_ID        = 6   # Отказ
  IN_WORK_ID          = 7   # В работе
  EXECUTED_ID         = 8   # Исполнено
end
