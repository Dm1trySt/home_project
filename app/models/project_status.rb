class ProjectStatus < ApplicationRecord

  STATUS_ACTIVE_ID     = 1 # Активный
  STATUS_CLOSED_ID     = 2 # Закрыт
  STATUS_ARCHIVED_ID   = 3 # В архиве

  # Получение сатутсов проекта в формате [name, id]
  def self.actual_project_statuses

    db_statuses = ProjectStatus.all

    statuses = []

    db_statuses.each do |status|
      statuses << [status.name, status.id]
    end
  end
end
