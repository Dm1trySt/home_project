class ProjectStatus < ApplicationRecord
  has_many :projects, dependent: :destroy

  # Получение сатутсов проекта в формате [name, id]
  def self.actual_project_statuses

    db_statuses = ProjectStatus.all

    statuses = []

    db_statuses.each do |status|
      statuses << [status.name, status.id]
    end
  end
end
